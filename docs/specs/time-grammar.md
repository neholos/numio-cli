---
id: SPEC-0001
title: Time Grammar and Arithmetic (Draft)
type: spec
status: draft
date: 2026-10-01
modules: [NumioCore, cli]
tags: [grammar, parsing, arithmetic, output]
owner: TBD
---
TL;DR: draft Numio grammar with examples table that becomes tests; open decisions D-1..D-4 must close before implementation.

> Status: draft. "Current" column marked `?` because current CLI behaviour not verified. First step: run examples and fill it.

## 1. Terms
- **Time of day (moment):** `HH`, `HH:mm`, `HH:mm:ss`.
- **Duration:** same or with units: `1h`, `24min`, `90s`, `1h24min`, `1h 24min`.
- **Expression:** operand, then pairs of `operator operand`; operators `+`, `-`. Evaluation left-to-right, no precedence.

## 2. Current Behaviour (from README and issues, verify)
`numio 12:30 + 02:15` adds/subtracts time in `HH:mm` or `HH`. Open: seconds (#2), `1h + 24min` (#11), multiple args (#10), dates `2025-01-01 +54d` (#4, out of scope), "addition broken" (#1, reproduce).

## 3. Open Decisions
| id | question | options | decision |
|----|----------|---------|----------|
| D-1 | Midnight wrap: `23:30 + 01:00` | (a) clock: `00:30`; (b) duration: `24:30`; (c) `00:30 (+1d)` | TBD |
| D-2 | Negative result: `00:10 - 00:20` | (a) `-00:10`; (b) wrap `23:50`; (c) error | TBD |
| D-3 | Units: `m` vs `min`, localisation (#3) | English only: `h`, `min`, `s`; or + Ukrainian | TBD |
| D-4 | Default output format | `HH:mm`; `HH:mm:ss` if seconds in operands | TBD |

## 4. Acceptance Examples (Source of Tests)
| # | Input | Expected Output | Current | Note |
|---|-------|-----------------|---------|------|
| 1 | `12:30 + 02:15` | `14:45` | ? | basic |
| 2 | `12:30 + 2` | `14:30` | ? | `HH` as hour |
| 3 | `12:30:15 + 00:00:50` | `12:31:05` | ? | seconds (#2) |
| 4 | `1h + 24min` | `01:24` | ? | durations (#11) |
| 5 | `12:00 + 1h 24min - 00:10` | `13:14` | ? | multiple operands (#10) |
| 6 | `23:30 + 01:00` | depends on D-1 | ? | midnight |
| 7 | `00:10 - 00:20` | depends on D-2 | ? | negative |
| 8 | `24:00` | TBD | ? | boundary |
| 9 | `12:75` | error, exit ≠ 0, stderr | ? | invalid minutes |
| 10 | `` (empty) | help, exit ≠ 0 | ? | empty input |

## 5. Errors
Message to stderr, non-zero exit, never print partial result to stdout. Message format: TBD.

## 6. Out of Scope for This Version
Time zones, calendar dates, arbitrary natural language.