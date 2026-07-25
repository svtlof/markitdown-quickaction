# Convert to Markdown — Finder Quick Action

Добавляет пункт **«Convert to Markdown»** в контекстное меню Finder (правый клик на файле → Quick Actions). Конвертирует PDF, Word, Excel, PowerPoint, изображения и другие форматы в `.md`, используя [MarkItDown](https://github.com/microsoft/markitdown) от Microsoft.

## Требования

- macOS 12+
- Python 3 (`brew install python`, если ещё не установлен)

## Установка

### Вариант 1 — одна команда

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/<ваш-юзернейм>/markitdown-quickaction/main/remote-install.sh)
```

### Вариант 2 — вручную

```bash
git clone https://github.com/<ваш-юзернейм>/markitdown-quickaction.git
cd markitdown-quickaction
chmod +x install.sh
./install.sh
```

Скрипт сам установит `markitdown` через pip, добавит Quick Action в Finder и назначит сочетание клавиш **⌘⌃M (Cmd+Ctrl+M)** по умолчанию.

### Изменить сочетание клавиш (опционально)

Если хотите другую комбинацию вместо ⌘⌃M:

```bash
./configure-hotkey.sh
```

Интерактивно спросит желаемую комбинацию и переназначит её.

## Использование

- Кликните правой кнопкой на любом поддерживаемом файле → **Quick Actions → Convert to Markdown**, либо
- выделите файл и нажмите **⌘⌃M**

Результат (`имя-файла.md`) появится в той же папке.

## Удаление

```bash
./uninstall.sh
```

## Как это работает

Это обёртка вокруг Automator Quick Action, которая вызывает CLI-утилиту `markitdown` для каждого выбранного файла.

## Лицензия

MIT
