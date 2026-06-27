# Skill: Documentation Change

## Purpose

Keep repository documentation accurate, concise, and aligned with actual files and commands.

## When to Use

Use for README, governance, adapter, or skill documentation changes.

## When Not to Use

Do not use when no user-facing behavior, setup, validation, or governance rule changes.

## Required Context

Read `AGENTS.md`, the documentation being changed, and files that prove the documented facts.

## Relevant Project Areas

`README.md`, `AGENTS.md`, `.agent/skills/`, adapter files, scripts, workflows.

## Procedure

1. Document only verified repository behavior.
2. Keep wording direct and avoid duplicating canonical rules across adapters.
3. Update command references when scripts or workflows change.
4. Remove stale statements instead of adding exceptions around them.

## Validation

Verify referenced files and commands exist. Run code validation only if code changed.

## Expected Output

Report documentation files changed and verification performed.

## Constraints

Do not claim support for tools, platforms, or workflows not present in the repository.

## Completion Criteria

Documentation is concise, accurate, and consistent with repository files.
