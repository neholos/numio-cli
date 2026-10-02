---
id: ADR-0001
title: Single Repository (Monorepo) and Package Layout
type: adr
status: proposed
date: 2026-10-01
modules: [NumioCore, cli]
tags: [layout, monorepo, release]
owner: TBD
---
TL;DR: one repo `numio` with Packages/ (core) and Apps/ (cli, later mac); Homebrew tap stays a separate repo.

## Context
Current repo `neholos/numio-cli`: Swift CLI with Homebrew tap (`brew tap neholos/numio`). Spotlight/Shortcuts planned, requiring an app with App Intents, so a second product will share logic with CLI. Two people and agents. Agents benefit from shared context and atomic cross-package changes (source on monorepos has commercial interest, but for your size the trade-off is clear).

## Decision
- One repo, targets: `Packages/NumioCore` (pure Swift), `Apps/cli`, later `Apps/mac`, plus `docs/`, `.agents/skills/`, `.opencode/agents/`.
- Tap remains separate repo (`homebrew-numio`, verify name): standard for Homebrew.
- CI with path filtering: build and test only what changed.
- Tags: plain `vX.Y.Z` while CLI is the only product; when `Apps/mac` appears, switch to prefixes (`cli-vX.Y.Z`, `mac-vX.Y.Z`).
- Rename repo to `numio`: GitHub redirects old URLs, but **verify URL and checksum in formula** before release.

## Consequences
Simpler: shared core/cli changes in one PR, one context for agents. Harder: CI and tags need thought; private app alongside open core in monorepo won't work (see below).

## When to Split
If you want a closed paid app with open MIT core: move `NumioCore` to a separate public package, app to private repo. Decision depends on business model, deferred.

## Reversibility
Doors open both ways until public releases with new tag format; after first release with new tags, changing gets harder.