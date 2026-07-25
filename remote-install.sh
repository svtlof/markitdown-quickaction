#!/bin/zsh
set -e

REPO_URL="https://github.com/<ваш-юзернейм>/markitdown-quickaction.git"
TMP_DIR="$(mktemp -d)"

echo "→ Клонирую репозиторий во временную папку..."
git clone --depth 1 "$REPO_URL" "$TMP_DIR" --quiet

echo "→ Запускаю установку..."
cd "$TMP_DIR"
chmod +x install.sh
./install.sh

echo "→ Убираю временные файлы..."
rm -rf "$TMP_DIR"

echo "✅ Установка завершена."
