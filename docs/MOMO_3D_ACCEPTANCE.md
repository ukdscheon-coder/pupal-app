# PUPAL Character Asset Production: execution gate

## Priority
Do not label a character complete until a real rigged GLB is built and visually reviewed against the approved user reference.

## Immediate production requirements for Momo
1. Obtain the approved front, side, and back reference artwork. Do not approximate the design from text.
2. Use Blender to sculpt an original otter mesh with distinctive head, muzzle, ears, eyes, paws, and tail.
3. Apply layered groomed fur detail and physically based materials. Validate both close-up and mobile renders.
4. Retopologize and rig with facial controls. Export GLB with idle, walk, jump, celebrate, comfort and blink animations.
5. Produce three individually modeled growth stages, not uniform scaling.
6. Review commercial rights for every input, generator weight, texture, and external model.
7. Only then copy approved assets into assets/characters/momo/{hatchling,baby,child}.glb and enable the model in character-manifest.json.
8. Test iPhone Safari animation playback, frame rate, memory, asset loading, and outfit attachments.

## Acceptance
- Production 3D model visually matches approved character art.
- Animated skeleton and expressive face are present.
- Growth changes body proportions and silhouette.
- GLB passes browser rendering on an actual iPhone.
- Rights and provenance documented.
- No emoji, SVG, or primitive mesh proxy accepted as a release asset.

## Current truthful status
These assets have not yet been generated. The model viewer is an integration and QA tool only.
