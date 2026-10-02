---
id: GUIDE-0006
title: Review Policy by Risk
type: guide
status: active
date: 2026-10-02
tags: [review, quality, docs]
owner: TBD
---
TL;DR: run deterministic checks for every change; reserve independent review for riskier work and require a human for T2/T3 changes.

## Tiers
`python3 scripts/review-tier.py <base>` classifies changed paths. The highest file tier applies; unknown paths default to T2.

| Tier | What | Minimum check |
|------|------|---------------|
| T0 | Descriptive docs | Read the diff; run docs metadata checks if applicable |
| T1 | CLI/core code and tests | Build and tests; independent verifier when the change is non-trivial |
| T2 | Specs, guides, scripts, package/agent configuration | Independent verifier and human review |
| T3 | Release workflow, Homebrew formula, signing | Human review and explicit approval |

## Checks
- Run `swift build` and `swift test` for code changes.
- Run `python3 scripts/build-index.py --check` after docs metadata changes.
- An agent review does not replace human review for T2/T3 changes.

Using a different-model verifier may provide another perspective, but it is not proven to reduce correlated errors. Do not add recurring review quotas or metrics without evidence they help.
