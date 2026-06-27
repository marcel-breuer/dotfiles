# Skill: Review Code

## Purpose

Review repository changes for correctness, safety, maintainability, and validation gaps.

## When to Use

Use when asked to review code or before completing a non-trivial change.

## When Not to Use

Do not use as a substitute for implementing requested changes.

## Required Context

Read `AGENTS.md`, changed files, relevant surrounding code, and validation configuration.

## Relevant Project Areas

All changed repository files, especially install scripts, dotfiles, Brewfile entries, and CI workflows.

## Procedure

1. Inspect only the diff and directly relevant context.
2. Prioritize bugs, data loss, security risks, broken idempotency, and missing validation.
3. Reference exact files and lines for findings when possible.
4. Separate confirmed findings from assumptions.

## Validation

Run or verify the validation commands relevant to the changed files when performing final checks.

## Expected Output

Lead with findings ordered by severity. If none are found, state that and note residual validation gaps.

## Constraints

Do not report style preferences without implementation impact.

## Completion Criteria

Material risks are identified clearly, and the review does not duplicate unrelated summaries.
