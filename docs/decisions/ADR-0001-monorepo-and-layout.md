---
id: ADR-0001
title: Single Repository (Monorepo) and Package Layout
type: adr
status: accepted
date: 2026-10-02
modules: [NumioCore, cli]
tags: [layout, monorepo, release]
owner: Sasha Jaroshevskii
---
TL;DR: keep the current `numio-cli` repo as the monorepo for `Packages/NumioCore`, `Apps/cli`, a future `Apps/mac`, and `Formula/numio.rb`; users install through a custom tap URL, not a separate tap repository.

## Context
Current repo `neholos/numio-cli` contains the Swift CLI; the formula currently lives in `neholos/homebrew-numio`. Spotlight/Shortcuts are planned, requiring an app with App Intents, so a second product will share logic with the CLI. Two people and agents benefit from shared context and atomic cross-package changes.

## Decision
- Keep `neholos/numio-cli` as the repository and monorepo; do not rename it as part of this migration.
- The target layout is `Packages/NumioCore` (pure Swift), `Apps/cli`, later `Apps/mac`, plus `Formula/numio.rb`, `docs/`, `.agents/skills/`, and `.opencode/agents/`.
- Keep the Homebrew formula in this repository. Users add it as a custom tap with `brew tap neholos/numio https://github.com/neholos/numio-cli`, then install with `brew install numio`.
- Retire the separate `homebrew-numio` repository only after the replacement formula and install path are merged and verified, and the DRI explicitly approves the retirement.
- CI with path filtering: build and test only what changed.
- Tags: plain `vX.Y.Z` while CLI is the only product; when `Apps/mac` appears, switch to prefixes (`cli-vX.Y.Z`, `mac-vX.Y.Z`).

## Consequences
Simpler: shared core/CLI and formula changes can be reviewed together, with one context for agents. The custom tap command is longer than the conventional `brew tap neholos/numio`; the formula URL and checksum still need verification on each release. Private app alongside open MIT core won't work (see below).

## When to Split
If you want a closed paid app with open MIT core: move `NumioCore` to a separate public package, app to private repo. Decision depends on business model, deferred.

## Reversibility
The formula can be moved back to a separate tap before repository-specific install instructions become widely adopted. Changing release tag formats after public releases makes migration harder.