# PUPAL 3D Character Production Standard

Characters: Momo (otter), Lulu (fox), Pico (fantasy dragon).
The approved reference images define the character identity and must be matched by real 3D meshes.

## Non-negotiable
- Never substitute emoji, SVG, flat sprites, or primitive mesh assemblies for production character models.
- A concept image is not a 3D model.
- Each character needs a real skinned mesh, authored skeleton, facial expressions, PBR materials and animation clips.
- All assets must have auditable commercial rights. The license of a generator does not automatically grant rights to its model weights, inputs or third-party assets.
- Use Blender for manual quality control, retopology, rigging, materials and export.

## Deliverables
For each character and each stage (hatchling, baby, child):
- assets/characters/{name}/{stage}.glb
- Blender editable source stored outside production web root
- approved front/side/back renders
- idle, walk, jump, happy, comfort, celebrate animation clips
- face blink, smile, worried and surprised morph targets (or equivalent facial rig)
- outfit attachment points and material palette metadata
- license provenance, generator version, weights license, source asset links and artist approval

## Growth
Do not uniformly scale a baby mesh. Use three stage-specific silhouettes, proportional changes and matching character identity. Progress is based on parent-verified missions. No punitive decline.

## Mobile acceptance
Validate on iPhone Safari and low-memory phones. Measure model loading, FPS, peak memory, animation transitions and visual similarity against approved reference. Do not ship until visually approved.

## Open source tools
Blender (GPL program, output rights separate); MakeHuman core exported assets CC0 but humanoid-centric; Three.js MIT; Ekza Studio MIT alpha. Image-to-3D generators require per-model weights and output rights review. Physical AI simulation is not required for expressive virtual pet animation.

## Current status
No production-quality rigged PUPAL GLB has been produced or approved yet. This repository is a functional app MVP, not a finished 3D character product.
