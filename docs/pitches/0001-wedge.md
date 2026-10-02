---
id: PITCH-0001
title: Numio Wedge: Most Reliable Time Arithmetic
type: pitch
status: proposed
date: 2026-10-01
modules: [NumioCore, cli]
tags: [wedge, strategy]
owner: TBD
---
TL;DR: don't compete with Soulver and Apple on breadth; be the most predictable time arithmetic engine, first in CLI, then Shortcuts/Spotlight.

> Draft. Everything marked TBD or `?` you decide together on Saturday.

## 1. Problem and Who For
- User (hypothesis): people who constantly calculate time (timesheets, shifts, training, video, log files) and want fast, predictable results without a spreadsheet. ? Who exactly is your first user.
- Evidence: open issues with real requests: seconds (#2), natural units `1h + 24min` (#11), multiple args (#10), dates (#4), install issues (#6, #5).
- Competition: Soulver 4 covers dates, intervals, time zones, timecodes; universal calculators have time arithmetic. Winning on breadth makes no sense.

## 2. Wedge (Hypothesis)
"Best utility for adding time" means these verifiable properties, each testable:
1. **Correctness:** day boundaries, negative results, seconds, no surprises.
2. **Predictability:** public spec (`docs/specs/time-grammar.md`) with examples that are tests.
3. **Speed in Hand:** natural notation (`1h 24min`), multiple operands, clear errors.
4. **Scriptability:** stable output format and exit codes.
Later: same logic in Shortcuts/Spotlight via App Intents. For Spotlight an app is needed; CLI alone won't appear there.

## 3. Press Release (Draft)
TBD. Headline style "Numio 1.0: calculate time the way you think". Three sentences on what it does, one on why it's more reliable.

## 4. FAQ
- Why not Soulver? TBD (answer must be about depth and scriptability, not breadth).
- Maintenance cost? One CLI + core on two people; each new surface adds tests and releases.
- What we don't do: time zones, calendars, arbitrary natural language parsing, cloud.

## 5. Appetite and First Bet
Cycle 1 (2 weeks): I-001 (extract NumioCore), I-002 (grammar v2: #1, #2, #10, #11), I-003 (release automation) if time.

## 6. Rabbit Holes
- Open decision on midnight wrap (D-1 in spec).
- Unit localisation (#3): `h/min/s` English only or also Ukrainian.
- Dates (#4) pull in calendars and time zones: deferred.

## 7. Metric
TBD. Candidate: users returning week 2 (how to measure for CLI, decide; Homebrew analytics gives only installs).

## 8. Support
CLI/core owner: TBD. Every release: CHANGELOG, tag, formula update.