---
id: EVAL-0002
title: Retrieval Questions for Agent Context Check
type: eval
status: active
date: 2026-10-01
tags: [context, retrieval, docs]
owner: TBD
---
TL;DR: 10 questions with known correct document; monthly ask agent and watch if it finds them without loading all docs/.

Method: new `orchestrator` session, question verbatim, no hints. Score: found correct doc (yes/no), how many docs opened, answered correctly.

| # | question | expected document |
|---|----------|-------------------|
| 1 | What did we decide about midnight wrap? | SPEC-0001 (D-1), related ADR |
| 2 | Which models in which agents and why different? | ADR-0002 |
| 3 | Did we decide to use DocC for process docs? | ADR-0003 |
| 4 | Which initiatives are active and who is DRI? | INIT-0000 |
| 5 | What open issues relate to seconds? | INIT-0000, SPEC-0001 |
| 6 | How to release and update Homebrew? | skill `release-homebrew`, ADR-0001 |
| 7 | What do we consciously not do? | PITCH-0001 (no-gos) |
| 8 | How do we decide on Spotlight? | INIT-0000 (I-006), PITCH-0001 |
| 9 | What is the meeting rhythm? | GUIDE-0001 |
| 10 | Why not add docs to `instructions`? | ADR-0004 |