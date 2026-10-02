---
id: GUIDE-0002
title: Principles and Sources (Research as of 2026-10-01)
type: guide
status: active
date: 2026-10-01
tags: [research, apple, agents, context, monorepo, opencode]
---
TL;DR: synthesis of practices the operating model stands on. Links only where verified; rest cited by name and author, find by title.

## Management and Quality
- Podolny, Hansen. "How Apple Is Organized for Innovation", HBR, Nov–Dec 2020: functional organisation, single P&L, experts manage experts.
- Lashinsky. "Inside Apple" (2012): DRI in agenda, narrow focus on few projects, weekly reviews.
- Kocienda. "Creative Selection" (2018): early and frequent demos, taste as practice.
- Bryar, Carr. "Working Backwards" (2021): PR/FAQ, written narratives over slides.
- Linear Method (linear.app/method): 1–3 week projects, 1–3 people, lead per project.
- Singer. "Shape Up" (Basecamp, free online): appetite, rabbit holes, no-gos. For ~15 person teams, adapt.
- DHH. "Software estimates have never worked and never will" (HEY World).

## Agents and Context
- Anthropic. "How we built our multi-agent research system" and "Building multi-agent systems: when and how to use them": multi-agent justified for parallel, context-heavy subtasks; coding less parallelisable; token costs significantly higher.
- Anthropic. "Effective context engineering for AI agents": just-in-time retrieval, lightweight identifiers, compaction, notes outside window.
- Git worktrees as parallel agent isolation: Augment Code reviews and engineering blogs; essence: separate working directories prevent agents overwriting each other.
- Nx. "The effect of monorepos on the effectiveness of AI agents": monorepo gives agents cross-project context and atomic changes. Author sells monorepo tools, read with that lens.

## Design System and Drift
- Design system governance reviews: hybrid model, exception register with review date, component lifecycle. Relevant for Numio when app appears.

## Spotlight and Competitors
- macOS Tahoe reviews (TechCrunch, 9to5Mac, AppleInsider, June 2025): Spotlight runs developer actions via App Intents and launches Shortcuts.
- Soulver 4 (App Store): dates, intervals, time zones, timecodes. Numio's wedge must be narrower and deeper.

## OpenCode (verified 2026-09-29)
- https://opencode.ai/docs/zen/ (models, pricing, privacy)
- https://opencode.ai/docs/agents/ · https://opencode.ai/docs/skills/ · https://opencode.ai/docs/rules/ · https://opencode.ai/docs/config/
- Docs note OpenCode v2 release (https://opencode.ai/v2): check version and schema before start.

## Models (see ADR-0002)
- NVIDIA on Nemotron 3 Ultra (vendor data): https://developer.nvidia.com/blog/nvidia-nemotron-3-ultra-powers-faster-more-efficient-reasoning-for-long-running-agents/
- MiMo-V2.5 vs Nemotron 3 Ultra comparison (BenchLM, no direct winner): https://benchlm.ai/compare/mimo-v2-5-vs-nemotron-3-ultra
- Kilo leaderboard: https://kilo.ai/leaderboard

## Point-Free
- The Point-Free Way, skills for agents (TCA, Dependencies, SwiftNavigation, SQLiteData): https://www.pointfree.co/the-way

## DocC
- swift-docc-plugin: https://github.com/swiftlang/swift-docc-plugin

## Limitations
Much Apple content comes from books and journalism, not official docs. Model benchmarks mostly vendor or aggregators. Experiments and design-system governance mentioned as future topics.