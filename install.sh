#!/bin/zsh
set -e

WORKFLOW_NAME="Convert to Markdown.workflow"
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST_DIR="$HOME/Library/Services"

echo "→ Checking Python and pip..."
if ! command -v python3 &> /dev/null; then
  echo "Python3 not found. Install it with: brew install python"
  exit 1
fi

echo "→ Installing/upgrading markitdown..."
pip3 install --upgrade 'markitdown[all]' --quiet

MARKITDOWN_PATH="$(command -v markitdown || true)"
if [ -z "$MARKITDOWN_PATH" ]; then
  echo "markitdown installed but not found in PATH. Check manually: pip3 show markitdown"
  exit 1
fi
echo "  markitdown found at: $MARKITDOWN_PATH"

echo "→ Copying Quick Action to $DEST_DIR ..."
mkdir -p "$DEST_DIR"
rm -rf "$DEST_DIR/$WORKFLOW_NAME"
cp -R "$SOURCE_DIR/$WORKFLOW_NAME" "$DEST_DIR/"

echo "→ Removing quarantine attribute (Gatekeeper)..."
xattr -dr com.apple.quarantine "$DEST_DIR/$WORKFLOW_NAME" 2>/dev/null || true

echo "→ Refreshing Finder services cache..."
/System/Library/CoreServices/pbs -flush

defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add "Convert to Markdown" "@^m"
killall Finder 2>/dev/null || true
killall Dock 2>/dev/null || true

echo ""
echo "✅ Done! You can now convert files by:"
echo "   1) Right-clicking → Quick Actions → Convert to Markdown"
echo "   2) Or selecting a file and pressing ⌘⌃M"

