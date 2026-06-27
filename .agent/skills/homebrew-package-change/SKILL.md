# Skill: Homebrew Package Change

## Purpose

Manage Homebrew formulae and casks in the repository package list.

## When to Use

Use when adding, removing, sorting, or reviewing entries in `install/Brewfile`.

## When Not to Use

Do not use for script-only changes unless package behavior also changes.

## Required Context

Read `AGENTS.md`, `install/Brewfile`, `install/packages.sh`, and README package instructions.

## Relevant Project Areas

`install/Brewfile`, `install/packages.sh`, `README.md`.

## Procedure

1. Verify the package belongs in a personal macOS dotfiles setup.
2. Use valid `brew` or `cask` syntax.
3. Avoid duplicate tools unless the reason is explicit.
4. Consider security, maintenance, licensing, size, and overlap with existing tools.
5. Update README only when setup or package-management behavior changes.

## Validation

Review `install/Brewfile`. Run `brew bundle check --file=install/Brewfile` when Homebrew is available and package validation is needed.

## Expected Output

Report package entries changed and validation performed or skipped.

## Constraints

Do not perform unrelated upgrades, removals, or package churn.

## Completion Criteria

The Brewfile remains valid, scoped, and consistent with documented install behavior.
