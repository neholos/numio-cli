---
id: ADR-0005
title: Future Mac App and App Intents Boundary
type: adr
status: proposed
date: 2026-10-02
modules: [NumioCore, mac]
tags: [app-intents, spotlight, architecture]
owner: TBD
---
TL;DR: a CLI alone does not add Numio actions to Spotlight; if the Mac surface is pursued, an app target should call the shared time-logic package.

## Context
The current product is a CLI. Spotlight/Shortcuts through App Intents requires an Apple app surface and has not been accepted as implementation work.

## Proposed direction
- Keep time arithmetic independent of CLI and app I/O so a future app can reuse it.
- Add App Intents only after a human-approved pitch and a small UX/platform spike.
- Do not create a separate intents package unless a second Apple surface needs it.

## Unresolved before implementation
The human DRI must choose the supported macOS version, distribution method, and intent input/output experience. This proposal does not create teams, ownership zones, shared-vector machinery, or implementation tasks.
