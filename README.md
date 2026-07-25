# Convert to Markdown — Finder Quick Action

Adds a **"Convert to Markdown"** item to the Finder context menu (right-click on file → Quick Actions). Converts PDF, Word, Excel, PowerPoint, images and other formats to `.md` using Microsoft's [MarkItDown](https://github.com/microsoft/markitdown).

## Requirements

- macOS 12+
- Python 3 (install with `brew install python` if not already installed)

## Installation

### Option 1 — one command

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/svtlof/markitdown-quickaction/main/remote-install.sh)
```

### Option 2 — manual

```bash
git clone https://github.com/svtlof/markitdown-quickaction.git
cd markitdown-quickaction
chmod +x install.sh
./install.sh
```

The script will automatically install `markitdown` via pip, add the Quick Action to Finder, and assign the keyboard shortcut **⌘⌃M (Cmd+Ctrl+M)** by default.

### Change keyboard shortcut (optional)

If you want a different combination instead of ⌘⌃M:

```bash
chmod +x configure-hotkey.sh
./configure-hotkey.sh
```

It will interactively ask for the desired combination and reassign it.

## Usage

- Right-click on any supported file → **Quick Actions → Convert to Markdown**, or
- Select a file and press **⌘⌃M**

The result (`filename.md`) will appear in the same folder.

## Uninstall

```bash
./uninstall.sh
```

## How it works

This is a wrapper around an Automator Quick Action that calls the `markitdown` CLI utility for each selected file.

## License

MIT
