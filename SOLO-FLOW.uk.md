# Solo Flow — Робота з агентами OpenCode

## Передумови (разово)

```bash
# 1. Скопіюйте operating kit в корінь репо
git checkout -b chore/operating-kit
cp -r files/numio-kit/* .
# 2. Збудуйте індекс
python3 scripts/build-index.py
# 3. Налаштуйте OpenCode
opencode
/connect          # оберіть Zen
/models           # перевірте ID моделей з opencode.json
```

---

## Команди для щоденної роботи

| Команда | Агент | Призначення |
|---------|-------|-------------|
| `/brief <завдання>, issue #N` | `orchestrator` | Impact analysis → пише `docs/briefs/<дата>-<slug>.md` → видає команду worktree |
| `/review <base-галузь>` | `orchestrator` → `review-tier.py` → `verifier` або `docs-reviewer` | Визначає tier (T0–T3), запускає відповідний рев'юер |
| `/practice-check <питання>` | `orchestrator` → `explore` + `researcher` (паралельно) | Повертає FIX/LEAVE/DECIDE з доказами; нічого не змінює |
| `/sync-docs <brief-файл>` | `docs-writer` → `docs-reviewer` | Оновлює README/CHANGELOG з "Docs impact", валідує, перебудовує індекс |
| `opencode --agent build` | `build` | Реалізує задачу з brief у worktree |

**Перемикання агентів у TUI:** Використовуйте селектор агента (не Tab — перевірте біндінг у вашій версії OpenCode).

---

## Цикл задачі

### 1. План
Оберіть одну ініціативу з `docs/initiatives.md`.

### 2. Brief
```
/brief додати парсинг секунд, issue #42
```
Прочитайте згенерований brief (`docs/briefs/...`). Перевірте: скоуп, дозволені шляхи, приклади приймання. **Правте brief, якщо він неправильний — це керує агентом.**

Якщо задача нечітка → orchestrator пропонує shaping spike. Див. `docs/guides/shaping-underspecified-work.md`.

### 3. Реалізація
```bash
scripts/new-task.sh <slug> build docs/briefs/<файл>.md
cd ../numio-<slug>
opencode --agent build
```
У TUI: `Execute task from docs/briefs/<файл>.md`

**Дозволи:** `swift build` / `swift test` — пред-approved. Інші команди — запитують підтвердження.
- `/undo` — відкотити останній крок + файлові зміни (стек)
- `/redo` — повторити

### 4. Рев'ю
```
/review main
```
Прочитайте вивід: tier, вердикт, топ знахідки, що перевірити вручну.
- T1: перевіряйте кожен 3-й diff
- T2/T3: читайте повний diff

### 5. Мердж і прибирання
```bash
git diff --name-only main   # підтвердіть скоуп
swift test                  # має пройти
# мердж через PR або прямо
git worktree remove ../numio-<slug>
# оновіть статус у initiatives.md
```

### 6. Документи
```
/sync-docs docs/briefs/<файл>.md
```

### 7. Журнал тертя
Допишіть у `docs/evals/friction-log.md` — що заважало.

---

## Коли застрягли

| Проблема | Виправлення |
|----------|-------------|
| Агент зациклився | `/undo`, звузьте brief, перезапустіть сесію |
| Слабкий результат | `/models` → змініть модель, повторіть; залогіть у bakeoff |
| Забагато запитів на дозволи | Додайте команду в `permission.bash` у `opencode.json` (T2 зміна) |
| Не впевнений щодо мерджу | `/review main`; якщо T2/T3 або сумніви — прочитайте diff самі |
| Не знаєте, що далі | `/brief` для наступної ініціативи або `/practice-check` для питання |
| Контекст переповнений | Нова сесія з brief (compaction увімкнено в конфігу) |

---

## Перші дві задачі (онбординг)

1. **Дрібна (T0/T1):** Пройдіть повний цикл — виправлення типо або один тест. Мета: перевірити, що кожен крок працює.
2. **Середня (T1):** Виконайте `/practice-check` по реальному питанні, потім виправте за результатом.

Після обох: перегляньте friction log, виправте 1–2 пункти.

---

## Ключові файли

| Файл | Роль |
|------|------|
| `docs/initiatives.md` | Роадмап + призначення DRI |
| `docs/briefs/<дата>-<slug>.md` | Контракт задачі: скоуп, шляхи, приймання |
| `docs/specs/time-grammar.md` | Spec-first: оновлюйте приклади + тести ДО коду |
| `docs/evals/friction-log.md` | Лог блокерів |
| `docs/decisions/ADR-XXXX-*.md` | Архітектурні рішення (тільки append) |
| `opencode.json` | Моделі, дозволи, агенти, compaction |
| `scripts/review-tier.py` | Класифікатор tier (T0–T3) |
| `scripts/new-task.sh` | Створює worktree + гілку + запускає агента |

---

## Розгортання по фазах

| Фаза | Увімкнути | Відкласти |
|------|-----------|-----------|
| Тиждень 1 | orchestrator, build, verifier, docs-writer, docs-reviewer, researcher | team-core, team-cli, crew |
| Тижні 2–3 | + вектори, ADR, enforcement специфікації | паралельні worktrees |
| Тиждень 4+ | team-core, team-cli (після виокремлення NumioCore) | cross-cutting crews |

Spotlight / `team-mac` запарковано (I-006).