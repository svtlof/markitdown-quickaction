#!/bin/zsh
set -e

WORKFLOW_NAME="Convert to Markdown.workflow"
DEST_DIR="$HOME/Library/Services"

echo "→ Удаляю $DEST_DIR/$WORKFLOW_NAME ..."
rm -rf "$DEST_DIR/$WORKFLOW_NAME"

echo "→ Обновляю кеш служб Finder..."
/System/Library/CoreServices/pbs -flush

echo "→ Удаляю сочетание клавиш..."
defaults delete NSGlobalDomain NSUserKeyEquivalents "Convert to Markdown" 2>/dev/null || true
killall Finder 2>/dev/null || true
killall Dock 2>/dev/null || true

echo "✅ Quick Action удалена. Пакет markitdown (pip) остался — удалить вручную:"
echo "   pip3 uninstall markitdown"
