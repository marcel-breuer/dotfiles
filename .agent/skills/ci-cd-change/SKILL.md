# Skill: CI/CD Change

## Purpose

Modify GitHub Actions validation while keeping local and CI checks aligned.

## When to Use

Use for changes under `.github/workflows/` or repository validation automation.

## When Not to Use

Do not use for pure script changes unless workflow behavior also changes.

## Required Context

Read `AGENTS.md`, affected workflow files, `scripts/lint-shell.sh`, and README quality-check instructions.

## Relevant Project Areas

`.github/workflows/shell-checks.yml`, `scripts/lint-shell.sh`, `README.md`.

## Procedure

1. Keep CI focused on repository-supported checks.
2. Keep local validation commands and CI commands consistent.
3. Pin or use stable official actions where already established.
4. Avoid adding secrets, deployment steps, or external services without explicit approval.

## Validation

Review workflow YAML and run `./scripts/lint-shell.sh` if shell scripts changed.

## Expected Output

Report workflow changes, local validation, and any CI-only behavior not executed locally.

## Constraints

Do not add broad CI/CD or deployment behavior unrelated to the task.

## Completion Criteria

CI remains minimal, understandable, and aligned with local validation.
