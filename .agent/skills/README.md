# Shared Agent Skills

Read the applicable `AGENTS.md` first, identify relevant skills, then read only those skills. `AGENTS.md` remains authoritative. If instructions conflict, report the conflict and apply the stricter or safer rule.

| Skill | Purpose | Use when | File |
| ----- | ------- | -------- | ---- |
| Shell Script Change | Safely modify Bash install or validation scripts | Changing `install.sh`, `install/*.sh`, or `scripts/*.sh` | `.agent/skills/shell-script-change/SKILL.md` |
| Dotfile Change | Update managed shell or Git dotfiles | Changing `.zshrc`, `.gitconfig`, or related symlink behavior | `.agent/skills/dotfile-change/SKILL.md` |
| Homebrew Package Change | Manage Homebrew formulae and casks | Adding, removing, or reviewing `install/Brewfile` entries | `.agent/skills/homebrew-package-change/SKILL.md` |
| Documentation Change | Keep repository docs accurate | Changing setup, usage, structure, validation, or governance docs | `.agent/skills/documentation-change/SKILL.md` |
| CI/CD Change | Update GitHub Actions checks | Changing `.github/workflows/` or validation automation | `.agent/skills/ci-cd-change/SKILL.md` |
| Review Code | Review changes for bugs and risks | Performing code review or pre-submission diff review | `.agent/skills/review-code/SKILL.md` |
| Security Review | Check security-sensitive changes | Reviewing install scripts, network downloads, secrets, permissions, or package changes | `.agent/skills/security-review/SKILL.md` |
