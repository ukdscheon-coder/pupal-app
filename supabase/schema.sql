-- PUPAL family sync foundation. Run only in a dedicated Supabase project.
create extension if not exists pgcrypto;
create table if not exists public.families (
 id uuid primary key default gen_random_uuid(),
 created_by uuid not null references auth.users(id),
 created_at timestamptz not null default now()
);
create table if not exists public.family_members (
 family_id uuid not null references public.families(id) on delete cascade,
 user_id uuid not null references auth.users(id) on delete cascade,
 role text not null check(role in ('parent','child')),
 joined_at timestamptz not null default now(),
 primary key(family_id,user_id)
);
create table if not exists public.missions (
 id uuid primary key default gen_random_uuid(),
 family_id uuid not null references public.families(id) on delete cascade,
 title text not null check(char_length(title) between 1 and 120),
 status text not null default 'todo' check(status in ('todo','declared','approved')),
 created_by uuid not null references auth.users(id),
 created_at timestamptz not null default now(),
 approved_at timestamptz
);
create index if not exists missions_family_idx on public.missions(family_id,created_at desc);
create or replace function public.is_family_member(fid uuid)
returns boolean language sql stable security definer set search_path = public
as $$ select exists(select 1 from public.family_members where family_id=fid and user_id=auth.uid()) $$;
create or replace function public.is_family_parent(fid uuid)
returns boolean language sql stable security definer set search_path = public
as $$ select exists(select 1 from public.family_members where family_id=fid and user_id=auth.uid() and role='parent') $$;
alter table public.families enable row level security;
alter table public.family_members enable row level security;
alter table public.missions enable row level security;
create policy "family owner can read" on public.families for select to authenticated using (created_by=auth.uid());
create policy "family owner can create" on public.families for insert to authenticated with check(created_by=auth.uid());
create policy "family members read" on public.family_members for select to authenticated using(public.is_family_member(family_id));
create policy "family creator joins as parent" on public.family_members for insert to authenticated with check (user_id=auth.uid() and role='parent' and exists (select 1 from public.families where id=family_id and created_by=auth.uid()));
create policy "members read missions" on public.missions for select to authenticated using(public.is_family_member(family_id));
create policy "parents add missions" on public.missions for insert to authenticated with check(public.is_family_parent(family_id) and created_by=auth.uid());
-- Deliberately no direct UPDATE policy: approve/declare via separately audited RPC functions.
-- Child onboarding and secure parent-approved pairing must be implemented before production use.
