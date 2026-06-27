# Skill: Shell Script Change

## Purpose

Modify Bash install and validation scripts safely while preserving idempotent macOS dotfiles setup.

## When to Use

Use for changes to `install.sh`, `install/*.sh`, or `scripts/*.sh`.

## When Not to Use

Do not use for pure documentation, Brewfile-only, or non-shell dotfile changes.

## Required Context

Read `AGENTS.md`, the target script, and any directly called script or documented command.

## Relevant Project Areas

`install.sh`, `install/packages.sh`, `scripts/lint-shell.sh`, `README.md`, `.github/workflows/shell-checks.yml`.

## Procedure

1. Identify the smallest script change that satisfies the task.
2. Preserve `#!/usr/bin/env bash`, `set -euo pipefail`, quoting, arrays, and existing function style.
3. Keep installer behavior idempotent and avoid interactive shell side effects.
4. Update documentation only when behavior, prerequisites, or commands change.
5. Review the diff for unintended machine mutations.

## Validation

Run `./scripts/lint-shell.sh`. If install paths changed, explain any unsafe-to-run path that was not executed.

## Expected Output

Report changed scripts, validation result, and any install behavior risk.

## Constraints

Do not add broad platform support, destructive file operations, or new network installers without explicit need.

## Completion Criteria

The script change is minimal, linted, documented if needed, and preserves safe repeated execution.
