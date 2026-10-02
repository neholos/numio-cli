# Numio CLI

Numio adds and subtracts times and durations from your terminal.

```sh
brew tap neholos/numio https://github.com/neholos/numio-cli
brew trust --formula neholos/numio/numio
brew install numio
```

```sh
numio 12:30 + 02:15
# 14:45
```

See the **[Numio guide](https://neholos.github.io/numio-cli/documentation/numio/guide)** for installation, expression syntax, examples, and limitations.

To build from source, run `swift build` and then `.build/debug/numio`. To run tests, use `swift test`.

## Contributing with OpenCode

### 1. Validate and describe the task

Reproduce the problem or establish evidence before asking for a code change. If the
problem or approach is unclear, use Plan to inspect the code, tests, and primary
sources without editing files; summarize evidence, options, and open questions.
The human owner chooses the direction.

Keep the issue as the brief: state the problem and evidence, expected behavior
(examples help), scope, acceptance checks, and a human owner. For a larger effort,
track its goal, child issues, and dependencies in a parent issue or GitHub Project.

### 2. Implement and verify

Start OpenCode in the task's Git worktree and use the default Build agent for a
well-defined issue. Use Plan only when requirements or approach need shaping, and
`@explore` only to locate unfamiliar code. A new chat does not isolate files.

For example:

> Implement issue #N in this worktree. Stay within its scope, add or update tests
> for the acceptance criteria, run the relevant checks, and review the diff.
> Report changed files, checks, and any remaining limitations. Do not commit,
> push, or create or merge a PR until I ask.

Review the diff and test results yourself. Fix failures before delivery; ask the
human owner rather than silently broadening scope when requirements conflict.

### 3. Parallel work and delivery

Use parallel tasks only when they are independent. Give every concurrent code
task its own branch/worktree and OpenCode session; never have two sessions edit
the same worktree. Coordinate child issues and merge order in the parent issue
or Project. If tasks share files, depend on one another, or need an unsettled
shared decision, agree on that decision first or do the work sequentially.

For each task, review its diff and checks, then merge PRs in dependency order.
Close the issue when the merged PR and CI satisfy its acceptance criteria.
Commit, push, and PR actions happen only when the human owner explicitly asks.

### 4. Keep documentation and tooling proportional

Put user-facing guides in DocC, public Swift API documentation beside the API,
behavior contracts and examples in the time spec and tests, and durable
architectural choices in ADRs. Keep task-specific research and coordination in
the issue; do not create a permanent document for a one-off answer.

Add a skill only for a recurring, non-trivial procedure that has proved easy to
forget. Add an agent only for a recurring need for different permissions or
independent work. Test additions on a real task and remove them if they do not
reduce mistakes or rework. Do not copy agent or skill collections just because
they are popular.

Numio is licensed under the [MIT license](LICENSE.md).
