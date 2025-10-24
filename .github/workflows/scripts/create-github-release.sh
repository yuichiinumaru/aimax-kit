#!/usr/bin/env bash
set -euo pipefail

# create-github-release.sh
# Create a GitHub release with all template zip files
# Usage: create-github-release.sh <version>

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <version>" >&2
  exit 1
fi

VERSION="$1"

# Remove 'v' prefix from version for release title
VERSION_NO_V=${VERSION#v}

gh release create "$VERSION" \
  .genreleases/aimax-kit-template-copilot-sh-"$VERSION".zip \
  .genreleases/aimax-kit-template-copilot-ps-"$VERSION".zip \
  .genreleases/aimax-kit-template-claude-sh-"$VERSION".zip \
  .genreleases/aimax-kit-template-claude-ps-"$VERSION".zip \
  .genreleases/aimax-kit-template-gemini-sh-"$VERSION".zip \
  .genreleases/aimax-kit-template-gemini-ps-"$VERSION".zip \
  .genreleases/aimax-kit-template-cursor-agent-sh-"$VERSION".zip \
  .genreleases/aimax-kit-template-cursor-agent-ps-"$VERSION".zip \
  .genreleases/aimax-kit-template-opencode-sh-"$VERSION".zip \
  .genreleases/aimax-kit-template-opencode-ps-"$VERSION".zip \
  .genreleases/aimax-kit-template-qwen-sh-"$VERSION".zip \
  .genreleases/aimax-kit-template-qwen-ps-"$VERSION".zip \
  .genreleases/aimax-kit-template-windsurf-sh-"$VERSION".zip \
  .genreleases/aimax-kit-template-windsurf-ps-"$VERSION".zip \
  .genreleases/aimax-kit-template-codex-sh-"$VERSION".zip \
  .genreleases/aimax-kit-template-codex-ps-"$VERSION".zip \
  .genreleases/aimax-kit-template-kilocode-sh-"$VERSION".zip \
  .genreleases/aimax-kit-template-kilocode-ps-"$VERSION".zip \
  .genreleases/aimax-kit-template-auggie-sh-"$VERSION".zip \
  .genreleases/aimax-kit-template-auggie-ps-"$VERSION".zip \
  .genreleases/aimax-kit-template-roo-sh-"$VERSION".zip \
  .genreleases/aimax-kit-template-roo-ps-"$VERSION".zip \
  .genreleases/aimax-kit-template-codebuddy-sh-"$VERSION".zip \
  .genreleases/aimax-kit-template-codebuddy-ps-"$VERSION".zip \
  .genreleases/aimax-kit-template-q-sh-"$VERSION".zip \
  .genreleases/aimax-kit-template-q-ps-"$VERSION".zip \
  --title "IA MAX Kit Templates - $VERSION_NO_V" \
  --notes-file release_notes.md
