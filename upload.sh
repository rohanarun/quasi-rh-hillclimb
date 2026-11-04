#!/usr/bin/env bash
# Sync this folder to https://github.com/rohanarun/quasi-rh-hillclimb and push.
# Works for the first upload and for later updates, from any freshly unzipped copy.
# Usage:  bash upload.sh ["commit message"]
set -euo pipefail
REPO="https://github.com/rohanarun/quasi-rh-hillclimb.git"
MSG="${1:-Update repository}"
SRC="$(cd "$(dirname "$0")" && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

if git clone -q "$REPO" "$TMP/repo" 2>/dev/null; then
  cd "$TMP/repo"
  if git rev-parse --verify -q origin/main >/dev/null; then
    git checkout -q -B main origin/main; echo "Updating existing main branch."
  else
    git checkout -q -B main; echo "Repo is empty; first upload."
  fi
else
  echo "Could not clone $REPO (check the URL and your GitHub login)."; exit 1
fi

# copy everything except git metadata and caches (files deleted locally are NOT deleted remotely)
tar -C "$SRC" --exclude=.git --exclude=__pycache__ --exclude='*.pyc' -cf - . | tar -xf -

git add -A
if git diff --cached --quiet; then
  echo "No changes to push."; exit 0
fi
git commit -q -m "$MSG"
git push -u origin main
echo "Done: https://github.com/rohanarun/quasi-rh-hillclimb"
