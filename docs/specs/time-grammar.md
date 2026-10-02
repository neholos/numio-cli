# Time Grammar and Arithmetic

> Status: accepted. The examples below are the source of truth for implementation and tests. The previous "Current" notes remain historical only.

## 1. Terms
- **Time of day (moment):** `HH`, `HH:mm`, `HH:mm:ss`.
- **Duration:** same or with units: `1h`, `24min`, `90s`, `1h24min`, `1h 24min`.
- **Expression:** operand, then pairs of `operator operand`; operators `+`, `-`. Evaluation left-to-right, no precedence.

## 2. Observed CLI Baseline (2026-10-02)
Checked with `swift run numio` on the repository baseline before this documentation cleanup. These observations describe the current implementation only; they do not resolve desired behavior.

| Input | Observed output |
|-------|-----------------|
| `12:30 + 02:15` | `14:45` |
| `23:30 + 01:00` | `00:30` |
| `00:10 - 00:20` | `23:50` |
| `1h + 24min` | error: invalid start time format |
| `12:00 + 1h 24min - 00:10` | error: unexpected arguments |

The CLI currently accepts the basic time arithmetic shown above. Seconds (#2), unit expressions (#11), multiple operands (#10), and dates (#4, out of scope) are not supported by those observations. Reproduce issue #1 separately before deciding its expected behavior.

## 3. Decisions
| id | question | options | decision |
|----|----------|---------|----------|
| D-1 | Midnight wrap: `23:30 + 01:00` | (a) clock: `00:30`; (b) duration: `24:30`; (c) `00:30 (+1d)` | (a) clock wraps at midnight |
| D-2 | Negative result: `00:10 - 00:20` | (a) `-00:10`; (b) wrap `23:50`; (c) error | (b) wrap to `23:50` |
| D-3 | Units: `m` vs `min`, localisation (#3) | English only: `h`, `min`, `s`; or + Ukrainian | English only: `h`, `min`, `s` |
| D-4 | Default output format | `HH:mm`; `HH:mm:ss` if seconds in operands | `HH:mm` unless any operand includes seconds |

## 4. Acceptance Examples (Source of Tests)
| # | Input | Expected Output | Current | Note |
|---|-------|-----------------|---------|------|
| 1 | `12:30 + 02:15` | `14:45` | `14:45` | basic |
| 2 | `12:30 + 2` | `14:30` | `14:30` | `HH` as hour |
| 3 | `12:30:15 + 00:00:50` | `12:31:05` | ? | seconds (#2) |
| 4 | `1h + 24min` | `01:24` | error | duration units unsupported |
| 5 | `12:00 + 1h 24min - 00:10` | `13:14` | error | multiple operands/units unsupported |
| 6 | `23:30 + 01:00` | `00:30` | `00:30` | midnight wrap |
| 7 | `00:10 - 00:20` | `23:50` | `23:50` | negative wrap |
| 8 | `24:00` | `24:00` | ? | boundary; explicit 24h literal is valid |
| 9 | `12:75` | error, exit ≠ 0, stderr | ? | invalid minutes |
| 10 | `` (empty) | help, exit ≠ 0 | ? | empty input |

The accepted contract treats clock arithmetic as a wrapped 24h clock. Duration arithmetic is expressed in `h`, `min`, and `s`, and output uses `HH:mm` unless at least one operand contains seconds.

## 5. Errors
Message to stderr, non-zero exit, never print partial result to stdout. Message format: TBD.

## 6. Out of Scope for This Version
Time zones, calendar dates, arbitrary natural language.
