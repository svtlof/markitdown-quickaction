#!/bin/zsh
set -e

SERVICE_NAME="Convert to Markdown"

echo "Configuring keyboard shortcut for \"$SERVICE_NAME\""
echo ""
echo "Select modifiers (multiple allowed, space-separated):"
echo "  1) Cmd (⌘)"
echo "  2) Option (⌥)"
echo "  3) Shift (⇧)"
echo "  4) Control (⌃)"
echo -n "Your choice (e.g.: 1 2): "
read -r mods

combo=""
for m in $mods; do
  case $m in
    1) combo="${combo}@" ;;
    2) combo="${combo}~" ;;
    3) combo="${combo}\$" ;;
    4) combo="${combo}^" ;;
  esac
done

echo -n "Enter a single key (e.g.: m): "
read -r key
combo="${combo}${key:l}"

echo ""
echo "→ Combination: $combo (character code)"
echo "→ Writing to settings..."

defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add "$SERVICE_NAME" "$combo"

echo "→ Restarting Finder and Dock to apply changes..."
killall Finder 2>/dev/null || true
killall Dock 2>/dev/null || true

echo ""
echo "✅ Done. You can verify/change this at:"
echo "   System Settings → Keyboard → Keyboard Shortcuts → Services"
echo ""
echo "If the shortcut doesn't work immediately, log out and log back in"
echo "(macOS sometimes requires a full logout to pick up NSUserKeyEquivalents changes)."
