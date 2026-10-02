# docs/ — як тут усе влаштовано

Документи в репо, поруч із кодом, змінюються через PR. Агенти не читають усе підряд:
вони йдуть через `INDEX.md` (генерується) і відкривають лише релевантне, починаючи з рядка `TL;DR:`.

## Типи документів
| type | де | що це | живе |
|---|---|---|---|
| pitch | `pitches/` | проблема, appetite, ставка (PR/FAQ-lite) | до рішення, потім історія |
| adr | `decisions/` | одне рішення і чому | назавжди (статус змінюється) |
| spec | `specs/` | поведінка, джерело правди для тестів | живий |
| initiative | `initiatives.md` | що в роботі, хто DRI | живий |
| eval | `evals/` | як міряємо моделі й пошук | живий |
| guide | `guides/`, `operating-model.md` | принципи й процеси | живий |
| brief | `briefs/` | задача для агента (не індексується) | тимчасовий |

## Обов'язковий frontmatter
```
---
id: ADR-0005            # унікальний
title: Коротка назва
type: adr               # pitch | adr | spec | initiative | eval | guide
status: proposed        # adr: proposed|accepted|superseded|rejected; pitch: proposed|bet|shipped|killed;
                        # spec: draft|accepted; initiative: active|parked|done
date: 2026-10-01
modules: [NumioCore]    # опційно, лише inline-списки
tags: [parsing]         # опційно
owner: ім'я             # опційно, людина (DRI)
supersedes: ADR-0002    # опційно
---
TL;DR: одне речення одразу після frontmatter.
```

## Правила
1. Один документ — одна мета. Посилайся на інші за `id`, не копіюй текст.
2. `TL;DR:` обов'язковий, перший рядок після frontmatter.
3. Відхилені ідеї й замінені рішення не видаляємо: міняємо `status`.
4. Після змін: `python3 scripts/build-index.py`. У CI: `python3 scripts/build-index.py --check`.
5. Мова: документи можуть бути українською, ключі frontmatter завжди англійською.
