# Skill: Dotfile Change

## Purpose

Update managed dotfiles without breaking install symlinks or interactive shell startup.

## When to Use

Use for `.zshrc`, `.gitconfig`, or changes to how dotfiles are linked.

## When Not to Use

Do not use for package-only, CI-only, or unrelated documentation changes.

## Required Context

Read `AGENTS.md`, the target dotfile, `install.sh` symlink handling, and README sections that describe dotfiles.

## Relevant Project Areas

`.zshrc`, `.gitconfig`, `install.sh`, `install/Brewfile`, `README.md`.

## Procedure

1. Confirm the dotfile is managed by `install.sh` or explicitly requested.
2. Keep machine-specific secrets and private settings out of the repository.
3. Preserve compatibility with installed shell tooling and Git defaults.
4. Update `install.sh` and README only if a new managed dotfile is added.

## Validation

Inspect syntax. Run `./scripts/lint-shell.sh` if shell scripts changed.

## Expected Output

Report changed dotfiles, related installer/doc updates, and validation.

## Constraints

Do not source interactive configuration from installers or commit personal credentials.

## Completion Criteria

The dotfile remains portable for this macOS setup and install behavior is accurate.
