# Entity LOD Bridge (NeoForge 1.21.1)

A small Java 21 / NeoForge 1.21.1 project scaffold for researching simplified 3D entity LODs integrated with Distant Horizons.

## Important status note

This ZIP is a **development scaffold**, not a finished entity-LOD renderer. It contains a NeoForge mod entry point, metadata, version configuration, and a runtime check for Distant Horizons. It does **not yet insert entity geometry into Distant Horizons' LOD pipeline**, and therefore does not make mobs appear across unloaded chunks. That requires a renderer bridge and a tested strategy for capturing entity state, generating simplified geometry, and submitting/caching it through DH's rendering system.

I have not run Gradle or compiled this project in this environment, so build success is unverified.

## Target setup

- Minecraft Java: 1.21.1
- Loader: NeoForge 21.1.172
- Java: JDK 21
- Optional runtime mod: Distant Horizons 2.2.1 or newer, with a release that explicitly supports Minecraft 1.21.1 / NeoForge
- Gradle plugin: ModDevGradle 2.0.147

The Distant Horizons API is bundled with the actual Distant Horizons mod. The separate API artifact is for development and should not be dropped into the `mods` folder as a normal gameplay mod.

## Open/build

1. Install a 64-bit JDK 21.
2. Open this folder in IntelliJ IDEA and import it as a Gradle project.
3. Let Gradle resolve the NeoForge development dependencies.
4. Run the `build` Gradle task. If it succeeds, the mod JAR should appear in `build/libs/`.
5. Test in a disposable profile/world first.

This source ZIP intentionally omits the Gradle wrapper JAR and scripts; use a locally installed Gradle or generate a wrapper from the imported project.

## Next implementation milestones

1. Pin the exact DH release/API matching 1.21.1.
2. Implement a client-side DH renderer integration point rather than only cancelling vanilla rendering.
3. Capture supported entity types at a controlled interval and serialize stable snapshots.
4. Generate cached low-poly meshes per entity type, preserving orientation and coarse animation.
5. Cull by distance/frustum and invalidate snapshots on chunk unload, entity removal, or world change.
6. Verify multiplayer behavior, resource reloads, modded entity fallbacks, and performance.

## References

- NeoForge 1.21.1 getting started: https://docs.neoforged.net/docs/1.21.1/gettingstarted/
- Distant Horizons API: https://modrinth.com/mod/distanthorizonsapi
- Existing related project (useful compatibility reference): https://github.com/steves-underwater-paradise/lodentityrendering


## Compilar no Windows (PowerShell)

Abra o terminal nesta pasta, onde está `build.gradle`, e execute:

```powershell
.\gradlew.bat build
```

Na primeira execução, o script baixa o JAR do Gradle Wrapper se ele ainda não estiver presente; o Wrapper então baixa a distribuição Gradle 8.10.2. É necessário ter Java JDK 21 e conexão com a internet. O comando `./gradlew build` é usado em terminais Unix como Bash; no PowerShell do Windows, use `.\gradlew.bat build`.
