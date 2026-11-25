#!/usr/bin/env bash
# Links these dotfiles into place. Existing files are moved aside as *.backup, never deleted.
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
    local src="$1" dest="$2"
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        echo "ok       $dest"
        return
    fi
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        mv "$dest" "$dest.backup"
        echo "backup   $dest -> $dest.backup"
    fi
    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
    echo "linked   $dest -> $src"
}

link "$DOTFILES/nvim" "$HOME/.config/nvim"
link "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"

# iTerm2 picks up profiles from this folder automatically (macOS only)
ITERM_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"
# (a .backup file can't live there: iTerm2 would load it as a duplicate profile)
ITERM_DEST="$ITERM_DIR/dark-catppuccin.json"
if [ -d "$HOME/Library/Application Support/iTerm2" ]; then
    if [ -e "$ITERM_DEST" ] && [ ! -L "$ITERM_DEST" ]; then
        echo "skipped  $ITERM_DEST already exists (delete it and re-run to link)"
    else
        link "$DOTFILES/iterm2/dark-catppuccin.json" "$ITERM_DEST"
    fi
fi

echo
echo "Done. Open nvim once to let it install plugins."
