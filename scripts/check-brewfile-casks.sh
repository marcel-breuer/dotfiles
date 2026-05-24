#!/usr/bin/env bash

set -euo pipefail

brewfile="${1:-install/Brewfile}"

if ! command -v brew >/dev/null 2>&1; then
	echo "brew is required to check installed casks."
	exit 1
fi

if [ ! -f "$brewfile" ]; then
	echo "Brewfile not found: $brewfile"
	exit 1
fi

declared_casks="$(mktemp)"
installed_casks="$(mktemp)"
missing_casks="$(mktemp)"

cleanup() {
	rm -f "$declared_casks" "$installed_casks" "$missing_casks"
}
trap cleanup EXIT

sed -nE 's/^[[:space:]]*cask[[:space:]]+"([^"]+)".*/\1/p' "$brewfile" | sort -u >"$declared_casks"
brew list --cask | sort -u >"$installed_casks"

comm -23 "$installed_casks" "$declared_casks" >"$missing_casks"

if [ -s "$missing_casks" ]; then
	echo "Installed casks missing from $brewfile:"
	sed 's/^/  - /' "$missing_casks"
	exit 1
fi

echo "All installed casks are declared in $brewfile."
