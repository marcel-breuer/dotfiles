# Skill: Security Review

## Purpose

Evaluate security-sensitive repository changes, especially local machine mutation and network installation behavior.

## When to Use

Use for changes involving downloads, package installation, sudo, filesystem writes, symlinks, secrets, CI permissions, or external services.

## When Not to Use

Do not use for purely editorial changes with no security relevance.

## Required Context

Read `AGENTS.md`, affected files, and any called scripts or workflows.

## Relevant Project Areas

`install.sh`, `install/packages.sh`, `install/Brewfile`, `.github/workflows/`, dotfiles, README setup instructions.

## Procedure

1. Identify trust boundaries: network downloads, privileged commands, filesystem writes, and local environment values.
2. Check quoting, path handling, backup behavior, and command failure handling.
3. Verify no secrets or personal sensitive data are introduced.
4. Confirm new external services or telemetry are explicitly approved.
5. Prefer restrictive defaults and clear failure modes.

## Validation

Run relevant repository checks. For risky install paths that are not executed, state the reason and review performed.

## Expected Output

Report validated risks, mitigations, and any unresolved assumptions.

## Constraints

Do not disable safety checks or recommend unverifiable security claims.

## Completion Criteria

Security-sensitive behavior is understood, scoped, and validated or explicitly disclosed.
