---
id: ADR-0003
title: DocC Guide for the Numio CLI
type: adr
status: accepted
date: 2026-10-03
modules: [cli]
tags: [docc, docs, github-pages]
---
TL;DR: use DocC for the CLI user guide and GitHub Pages; keep pitches, ADRs, specs, initiatives, and process guides in Markdown.

## Context
The current package has one executable target, `numio`, rather than a public core library. Users need a short guide to installing and using the CLI. The repository's `docs/` files use frontmatter and a generated index for project decisions and process; they serve a different purpose from the user guide.

## Decision
1. Build the DocC catalog for the existing `numio` executable target and publish its static site with GitHub Actions to Pages.
2. Keep project process documentation, including specs and ADRs, in `docs/` as Markdown.
3. Keep the user guide concise and document only behavior verified against the implementation and tests.

## Reversibility
The DocC catalog and workflow can be removed without changing CLI behavior. If a core library is added later, its API documentation can be scoped separately.
