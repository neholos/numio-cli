---
id: ADR-0003
title: DocC Only for NumioCore API, Process Docs Stay Markdown
type: adr
status: proposed
date: 2026-10-01
modules: [NumioCore]
tags: [docc, docs, github-pages]
owner: TBD
---
TL;DR: yes, add DocC, but only for public NumioCore API (and a few articles); pitches, ADRs, specs, initiatives stay plain Markdown with frontmatter for agents.

## Context
swift-docc-plugin gives `swift package generate-documentation` for libraries and executable SwiftPM targets (Swift 5.6+). For GitHub Pages there are flags `--transform-for-static-hosting` and `--hosting-base-path <repo>`, output must allow `--allow-writing-to-directory`.
Process docs (`docs/`) are read by agents via grep on frontmatter and `INDEX.md`; they need plain Markdown. As far as known, DocC has its own article format and doesn't process YAML frontmatter: verify before trying.

## Decision
1. **Now:** write `///` doc comments for public NumioCore API. Immediate benefit: read by both humans and agents.
2. **After API stabilisation** (after I-001 and I-002): add `swift-docc-plugin` dependency, directory `Packages/NumioCore/Sources/NumioCore/Documentation.docc` and article "Time Grammar" (with spec examples).
3. **Publishing:** GitHub Actions builds DocC and publishes to GitHub Pages. Also a public trust signal for the product.
4. **Don't do:** move `docs/pitches`, `docs/decisions`, `docs/initiatives.md`, `docs/specs` to DocC.

## Trigger for Steps 2–3
Second core consumer (Mac app or Shortcuts) or first external library user.

## Test Command (When Ready)
```
swift package --allow-writing-to-directory ./docs-site \
  generate-documentation --target NumioCore --output-path ./docs-site \
  --transform-for-static-hosting --hosting-base-path numio
```

## Reversibility
Doors open both ways: DocC added and removed without code impact.