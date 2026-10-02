---
id: ADR-0002
title: OpenCode Models for Implementation and Review
type: adr
status: proposed
date: 2026-10-02
tags: [opencode, agents, models, privacy, cost]
owner: TBD
---
TL;DR: Nemotron 3 Ultra Free is the implementation candidate and MiMo-V2.6 Flash Free is the optional independent verifier; neither model's quality on this repository has been measured.

## Context
The model list, pricing, privacy terms, and free availability can change. Check the current OpenCode Zen documentation before relying on them. Do not send secrets or private business information to free-model endpoints.

Published model scores are vendor or aggregator results and do not establish which model performs best on this small Swift repository. General agent research also does not establish that a multi-agent workflow or a different-family reviewer improves this project. See [EVAL-0001](../evals/model-bakeoff.md) for a small, conditional comparison protocol.

## Current configuration
| Role | Model | Use |
|------|-------|-----|
| `implementer` | `opencode/nemotron-3-ultra-free` | Default scoped implementation |
| `verifier` | `opencode/mimo-v2.6-flash-free` | Read-only review when independent review is warranted |

The different-family reviewer is a hypothesis for a second perspective, not a demonstrated reduction in correlated errors. Deterministic build and test results remain primary.

## Privacy and reversibility
Numio's repository is public, but prompts must still exclude credentials, personal data, and private business information. At the last check, Zen described these free models as temporary; Nemotron usage could be logged and MiMo prompts could be used to improve models. Re-check current provider terms before use. Both assignments can be changed in `.opencode/agents/` without changing product behavior.
