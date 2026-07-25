#!/bin/zsh
set -e

WORKFLOW_NAME="Convert to Markdown.workflow"
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST_DIR="$HOME/Library/Services"

echo "→ Проверяю Python и pip..."
if ! command -v python3 &> /dev/null; then
  echo "Python3 не найден. Установите его: brew install python"
  exit 1
fi

echo "→ Устанавливаю/обновляю markitdown..."
pip3 install --upgrade 'markitdown[all]' --quiet

MARKITDOWN_PATH="$(command -v markitdown || true)"
if [ -z "$MARKITDOWN_PATH" ]; then
  echo "markitdown установился, но не найден в PATH. Проверьте вручную: pip3 show markitdown"
  exit 1
fi
echo "  markitdown найден: $MARKITDOWN_PATH"

echo "→ Копирую Quick Action в $DEST_DIR ..."
mkdir -p "$DEST_DIR"
rm -rf "$DEST_DIR/$WORKFLOW_NAME"
cp -R "$SOURCE_DIR/$WORKFLOW_NAME" "$DEST_DIR/"

echo "→ Снимаю карантинный атрибут (Gatekeeper)..."
xattr -dr com.apple.quarantine "$DEST_DIR/$WORKFLOW_NAME" 2>/dev/null || true

echo "→ Обновляю кеш служб Finder..."
/System/Library/CoreServices/pbs -flush

defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add "Convert to Markdown" "@^m"
killall Finder 2>/dev/null || true
killall Dock 2>/dev/null || true

echo ""
echo "✅ Готово! Файл можно конвертировать так:"
echo "   1) Кликнуть правой кнопкой → Quick Actions → Convert to Markdown"
echo "   2) Или выделить файл и нажать ⌘⌃M"

