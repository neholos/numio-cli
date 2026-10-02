---
id: INIT-0000
title: Реєстр ініціатив
type: initiative
status: active
date: 2026-10-01
tags: [roadmap, wip]
---
TL;DR: що в роботі зараз (не більше трьох активних), хто DRI і яке джерело, закрите чи заморожене тут же; оновлюється щопонеділка.

Правило: статус `active` у не більше ніж трьох рядків. DRI = людина. Issues у дужках з `neholos/numio-cli`.

| id | назва | DRI | статус | appetite | зачіпає | issues / джерела |
|---|---|---|---|---|---|---|
| I-001 | Виокремити NumioCore, cli як тонка обгортка | TBD | active | 1 день | NumioCore, cli | ADR-0001 |
| I-002 | Граматика v2: секунди, `1h 24min`, кілька операндів, відтворити #1 | TBD | active | 1-2 тижні | NumioCore, cli | #1, #2, #10, #11, SPEC-0001 |
| I-003 | Автоматизація релізу й Homebrew | TBD | parked (цикл 1, якщо лишиться час) | 2-3 дні | release | #5, #6, #7, #9 |
| I-004 | Міграція на Swift 6 | TBD | parked | 1 день | all | #8 (SPI вже показує успішну збірку на Swift 6.2 для v1.0.0, перевір, що саме лишилось) |
| I-005 | Дати: `2025-01-01 +54d` | TBD | parked | потрібен pitch | NumioCore | #4 |
| I-006 | Spotlight/Shortcuts через App Intents (спершу одноденний спайк) | TBD | parked | потрібен pitch | Apps/mac | ADR-0001, ADR-0005 |
| Q-001 | Мова одиниць і інтерфейсу (#3) | TBD | відкрите питання → D-3 | | spec | #3 |
