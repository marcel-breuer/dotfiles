# Repository Agent Instructions

These instructions apply to every human or AI coding agent working in this repository, regardless of the tool, model, IDE, extension, CLI, automation platform, or execution environment.

## Scope and Applicability

- This root `AGENTS.md` is the canonical source of project-wide instructions.
- Local `AGENTS.md` files MAY add directory-specific rules. The nearest applicable `AGENTS.md` takes precedence for local implementation details.
- Local rules MUST NOT weaken security, privacy, compliance, or review requirements from this file.
- Agent-specific adapter files MUST remain thin references to this file, local `AGENTS.md` files, and `.agent/skills/`.
- Shared skills in `.agent/skills/` supplement these rules but MUST NOT override or contradict them.

## Instruction Priority

Apply instructions in this order:

1. Explicit task requirements and acceptance criteria.
2. Security, privacy, legal, and compliance requirements.
3. Nearest applicable local `AGENTS.md`.
4. Root `AGENTS.md`.
5. Existing architecture and established repository patterns.
6. Repository configuration.
7. Tests and technical documentation.
8. Official language and framework documentation.
9. Established community standards.
10. Explicitly documented assumptions.

Agents MUST NOT invent business requirements.

## Project Overview

- This repository contains personal macOS dotfiles and install automation.
- Primary languages and formats: Bash, Zsh, Git config, Homebrew `Brewfile`, YAML, and Markdown.
- Main entry point: `install.sh`.
- Package installation entry point: `install/packages.sh`, which uses Xcode Command Line Tools, Homebrew, and `install/Brewfile`.
- Quality check entry point: `scripts/lint-shell.sh`, which runs `shellcheck` and `shfmt -d` on `*.sh` files discovered by `rg`.
- CI: `.github/workflows/shell-checks.yml` runs `./scripts/lint-shell.sh` on push to `main`/`master` and on pull requests.
- Managed dotfiles: `.zshrc` and `.gitconfig`, symlinked by `install.sh` with timestamped backups for existing files.
- No Dockerfile, Compose file, application runtime, database, API service, frontend app, or infrastructure-as-code configuration is currently present.

## Source of Truth

When deciding how to implement a change, use this technical priority:

1. Existing implementation and established patterns.
2. Project configuration.
3. Tests and validation scripts.
4. Repository documentation.
5. Official language and framework documentation.
6. Established standards.

Agents MUST NOT replace existing conventions with personal preferences without a concrete technical reason.

## Token-Efficient Work

- Read only files relevant to the current task.
- Do not scan the full repository when targeted inspection is sufficient.
- Prefer precise searches over broad file reads.
- Avoid repeatedly reading unchanged files.
- Do not restate the complete task before starting.
- Do not repeat rules already defined in this file.
- Do not include long implementation plans unless task complexity requires them.
- Keep plans concise and focused on execution-critical steps.
- Do not narrate routine tool usage.
- Report only findings that affect implementation, validation, risk, or review.
- Prefer diffs and targeted edits over rewriting complete files.
- Avoid creating abstractions, documentation, comments, tests, or files that are not required.
- Do not produce large code excerpts in final responses when file references are sufficient.
- Do not duplicate the same information across summaries, findings, and completion reports.
- Use concise tables or short lists where they reduce repetition.
- Preserve correctness, security, and completeness; token efficiency MUST NOT justify skipping required analysis or validation.

Final output should normally contain only what changed, files changed, validations executed, and unresolved issues, assumptions, or risks. Omit empty sections.

## Bash, Zsh, and Shell Standards

- Shell scripts MUST use Bash when they rely on Bash features and MUST keep the existing `#!/usr/bin/env bash` shebang.
- Shell scripts MUST keep `set -euo pipefail` unless there is a documented technical reason.
- Shell code MUST pass `shellcheck` and `shfmt -d`.
- Prefer functions for repeated shell behavior that already has an established pattern, such as status output and symlink handling.
- Quote variable expansions unless word splitting or globbing is explicitly intended.
- Use arrays for command/file lists in Bash.
- Prefer explicit checks for required commands and readable error messages.
- Preserve idempotency of install scripts. Existing correct symlinks MUST remain untouched, and existing user files MUST be backed up before replacement.
- Avoid sourcing interactive shell configuration from non-interactive installers.
- `.zshrc` changes MUST remain compatible with Oh My Zsh and the installed plugins in `install/Brewfile`.

## Architecture Rules

- `install.sh` owns orchestration: sudo setup, repository update, symlink creation, package installation, optional local extras, and final shell guidance.
- `install/packages.sh` owns package prerequisites and Homebrew bundle execution.
- `install/Brewfile` is the source of truth for Homebrew formulae and casks.
- `scripts/lint-shell.sh` owns local shell validation.
- Keep personal local extensions outside the repository in `$HOME/.extra` unless explicitly requested.
- New scripts SHOULD live in `scripts/` unless they are part of install flow, where `install/` is appropriate.
- New abstractions require a concrete benefit such as reducing meaningful duplication or isolating a repeated workflow.

## Code Quality

- Changes MUST be small, focused, and reviewable.
- Do not leave dead code, commented-out code, unused variables, or unused imports.
- Use meaningful constants or variables instead of unexplained literals when the value is reused or non-obvious.
- Comments SHOULD explain why, not restate what the code does.
- Do not broaden public behavior, install scope, or machine mutations without making the change explicit.
- Do not weaken existing linting, formatting, safety flags, or validation behavior.

## Naming Conventions

- Shell functions and variables SHOULD use `snake_case`; environment variables SHOULD use `UPPER_SNAKE_CASE`.
- Script filenames SHOULD be lowercase and hyphen-separated, matching `lint-shell.sh`.
- Homebrew package entries MUST use valid `brew` or `cask` declarations.
- Workflow and documentation names SHOULD be direct and task-specific.
- Names MUST be domain-specific and unambiguous.

## Testing and Validation

- There is no dedicated unit test framework in this repository.
- Shell validation is performed with `./scripts/lint-shell.sh`.
- Bug fixes to install behavior SHOULD be validated by the narrowest safe command or dry-run/manual reasoning available, and any unexecuted risky path MUST be disclosed.
- Tests or checks MUST evaluate observable behavior rather than implementation details where feasible.
- Do not remove or weaken validation merely to make a change pass.

## Validation Commands

| Change type | Required validation |
| --- | --- |
| Shell scripts | `./scripts/lint-shell.sh` |
| Dotfiles | Inspect syntax and run `./scripts/lint-shell.sh` if shell scripts changed |
| Homebrew package list | Review `install/Brewfile`; run `brew bundle check --file=install/Brewfile` when Homebrew is available and package validation is needed |
| GitHub Actions | Review YAML and run `./scripts/lint-shell.sh` if shell scripts changed |
| Documentation or agent instructions | Review Markdown and verify referenced files/commands exist |

If a command cannot be executed, state why. No project-defined Docker validation command exists at this time; if Docker configuration is added later, prefer the project-defined container workflow for installs, checks, and tests when technically possible.

## Dependency and Package Management

- Homebrew packages are managed in `install/Brewfile`.
- Do not add packages without a task-specific reason.
- Avoid duplicate tools that serve the same purpose unless the tradeoff is documented.
- Consider security, maintenance, licensing, install size, and macOS compatibility before adding formulae or casks.
- Do not perform unrelated package upgrades or removals.
- Do not edit lockfiles; none are currently present.

## Security, Privacy, and Compliance

- MUST NOT commit secrets, credentials, tokens, private keys, production personal data, or machine-local sensitive values.
- Keep machine-specific private customization in `$HOME/.extra` or another ignored local path.
- Network installs MUST use trusted official sources already established by the repository unless explicitly approved.
- Use `curl` only with failure-aware flags such as `-f` when downloading installer content.
- Do not bypass authentication, authorization, macOS permission prompts, or security controls.
- Avoid logging sensitive local paths or environment values beyond what is necessary for user-facing install diagnostics.
- Do not add telemetry, external services, or repository-content uploads without explicit approval.
- Validate and quote filesystem paths used in commands and symlinks.

## Documentation Rules

- Update `README.md` when setup, install behavior, requirements, structure, or validation commands change.
- Do not document commands that do not exist or were not verified from repository files.
- Do not make unverified claims about supported platforms beyond the current macOS focus.
- Generated documentation, if introduced later, MUST NOT be manually edited unless its generator requires it.

## Agent-Specific Adapters

- `CLAUDE.md`, `.cursor/rules/agent-governance.mdc`, and `.github/copilot-instructions.md` are thin adapters to this file and `.agent/skills/`.
- No OpenCode, Windsurf, Cline, Roo Code, or Aider configuration is currently present. Those and comparable agents are governed by this file and `.agent/skills/` unless a supported adapter is added later.
- Adapter files MUST NOT duplicate the complete rule set.

## Git and Change Scope

- Limit changes to the task.
- Do not perform unrelated refactors or formatting of untouched files.
- Do not manually edit generated files.
- Do not overwrite local changes.
- Do not use destructive Git commands unless explicitly requested.
- Do not commit, push, tag, release, or open pull requests without explicit instruction.
- Do not change CI/CD, install behavior, package lists, or security-sensitive configuration unless required by the task.

## Agent Workflow

1. Read the task and acceptance criteria.
2. Read the applicable `AGENTS.md`.
3. Identify and read only relevant skills from `.agent/skills/`.
4. Inspect only relevant files and existing patterns.
5. Evaluate architecture, dependencies, and risks.
6. Plan the smallest viable change.
7. Implement the change.
8. Add or update tests or checks when applicable.
9. Run relevant validation commands.
10. Review the diff for unintended changes.
11. Report changes, validation, assumptions, and remaining risks concisely.

Agents MUST NOT begin implementation before checking the relevant rules and skills.

## Definition of Done

A task is complete only when:

- Acceptance criteria are met.
- Architecture rules are followed.
- Relevant validation succeeds or skipped checks are disclosed.
- Security and privacy requirements are met.
- Documentation is updated where required.
- No unintended files changed.
- Assumptions and remaining risks are stated.
