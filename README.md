# PUPAL: Pupals & Friends

A privacy-first family school-routine mobile web app.

## Live Prototype
GitHub Pages deployment is configured. Once Pages is enabled from the Actions workflow in repo Settings → Pages (Source: GitHub Actions), the live URL is:

**https://ukdscheon-coder.github.io/pupal-app/**

Open on iPhone/iPad Safari and Add to Home Screen for app-like experience.

## Current working scope
- Parent and Kid modes on one device
- Mission creation, child-declared completion, parent approval
- LocalStorage persistence, 10 virtual coins per approved mission
- Family reward configuration
- Character gallery page (`/characters.html`) ready for approved images
- 3D viewer for future GLB models

## Deploy options
### GitHub Pages (recommended for free immediate deploy)
Workflow `.github/workflows/deploy-pages.yml` is ready. Enable in Settings → Pages → Source: GitHub Actions.

### Vercel (alternative)
1. Go to vercel.com → New Project
2. Import `ukdscheon-coder/pupal-app`
3. Framework Preset: Other
4. Build Command: (leave empty)
5. Output Directory: `.`
6. Deploy

The `vercel.json` is already configured for static hosting.

## Character Assets
To make approved characters appear:
- Create folder `assets/characters/`
- Add exact approved JPG/PNG images as `character1.jpg`, `character2.jpg` etc.
- They will show with floating animation on `/characters.html`
- For true 3D, produce matching GLB files and place in `/assets/characters/{name}/{stage}.glb`

**Never substitute designs. Only use the exact approved character images.**

## Not yet implemented
- Production-quality rigged 3D characters matching approved designs
- Cross-device family pairing, secure backend and push notifications

## Privacy
No real child names, school names, child photos, or exact locations are required. Data currently stays in browser LocalStorage. Do not use this prototype for sensitive personal information.

## Development workflow
Push to main triggers GitHub Actions syntax checks and Pages deploy. Production release requires separate mobile, privacy and animation quality checks.
