---
id: ADR-0005
title: Contracts and Ownership: Core and Surfaces (Shortcuts/Spotlight)
type: adr
status: proposed
date: 2026-10-01
modules: [NumioCore, cli, mac]
tags: [contracts, ownership, spotlight, app-intents, teams]
owner: TBD
---
TL;DR: team per surface, not per channel (`team-mac` = Apple surfaces), one owner per zone with open contributions, three contracts between core and surfaces; form team only after pitch, stable core API, and one-day spike.

## Context
- Spotlight on Mac can run app actions; added via App Intents, same as Shortcuts (WWDC25, "Develop for Shortcuts and Spotlight with App Intents"). So CLI won't appear in Spotlight alone: an app is needed.
- Intents can live in main target, App Intents extension, or (from 2025) in Swift packages; each target registers as `AppIntentsPackage`. System may run intent in app or extension. Check details in WWDC25 "Explore new advances in App Intents" and `AppIntents` docs.
- Same intents serve Shortcuts, Spotlight, and Siri, so Spotlight is a channel, not a separate product.

## Decision
1. **Team per surface.** `team-mac` (Apple surfaces) owns App Intents, app shell, signing/notarisation, and release. No separate "Spotlight team".
2. **Layers.** `NumioCore` (pure logic) ← `Apps/cli`, `Apps/mac` (intents inside). Extract `Packages/NumioIntents` only when a second consumer appears (iOS app, widget, extension).
3. **Three contracts.**
   - **C1, Core API:** public Swift API with `///`, typed errors with stable codes.
   - **C2, Shared Test Vectors:** examples from `SPEC-0001` in machine-readable file (e.g. `Packages/NumioCore/Tests/NumioCoreTests/Vectors/time-vectors.json`); run by core, CLI, and intent tests. All surfaces must produce identical results.
   - **C3, Surface Rules:** how core errors map to CLI exit codes and intent errors; who owns localisation strings and parameter phrases.
4. **Ownership.** One owner per zone, contributions open ("inner source"): surface proposes core change via brief, core owner reviews. Shared ownership without DRI means nobody owns.
   | Zone | Owner | What |
   |------|-------|------|
   | core | core-DRI | semantics, grammar, vectors, API |
   | cli | cli-DRI | arguments, output, exit codes, Homebrew |
   | mac | mac-DRI | intents, app, signing, release |
   | shared | platform-DRI | `Package.swift`, CI, `opencode.json`, `AGENTS.md`, ADR |
5. **Contract Change.** C1/C2 change makes all surface tests red in one PR (monorepo advantage): PR either updates all consumers, or splits in two with deprecation period.
6. **Enforcement.** `.github/CODEOWNERS` (see `.github/CODEOWNERS.example`) plus `git diff --name-only` check in verifier. Agents are never owners.

## Team Formation Prerequisites
- Spotlight pitch accepted (I-006).
- I-001 and I-002 done, vectors exist.
- Decided: minimum macOS version (Spotlight actions appeared in macOS 26, verify), Mac App Store or direct distribution, Apple Developer Program membership. Signing and notarisation is separate work, not code: account in appetite.

## One-Day Spike (Before Team)
Minimal app with one intent (`AddTimeIntent`) calling NumioCore. Verify: appears in Spotlight, parameter input UX, better: one text expression or structured parameters. This is the main UX decision and defines appetite.

## Reversibility
Doors open both ways until public app release. Package split can be done later.