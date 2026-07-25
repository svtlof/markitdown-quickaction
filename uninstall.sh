#!/bin/zsh
set -e

WORKFLOW_NAME="Convert to Markdown.workflow"
DEST_DIR="$HOME/Library/Services"

echo "→ Removing $DEST_DIR/$WORKFLOW_NAME ..."
rm -rf "$DEST_DIR/$WORKFLOW_NAME"

echo "→ Refreshing Finder services cache..."
/System/Library/CoreServices/pbs -flush

echo "→ Removing keyboard shortcut..."
defaults delete NSGlobalDomain NSUserKeyEquivalents "Convert to Markdown" 2>/dev/null || true
killall Finder 2>/dev/null || true
killall Dock 2>/dev/null || true

echo "✅ Quick Action removed. The markitdown package (pip) remains — remove manually with:"
echo "   pip3 uninstall markitdown"
