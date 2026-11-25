# dotfiles

My terminal setup for C++ work on macOS: **Neovim + tmux + iTerm2**, all in the
[Catppuccin Mocha](https://catppuccin.com) colors.

```
nvim/     Neovim config (lazy.nvim, one file per plugin in lua/plugins/)
tmux/     tmux.conf
iterm2/   dark iTerm2 profile with the Nerd Font
install.sh  links everything into place
```

## Install

```sh
# requirements
brew install neovim tmux
brew install --cask iterm2 font-jetbrains-mono-nerd-font
npm install -g tree-sitter-cli   # builds syntax parsers (Homebrew's version compiles Rust from source)
xcode-select --install           # clang + clangd for C++ IntelliSense

git clone https://github.com/stephenl99/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

Then in iTerm2: **Settings → Profiles → "Dark (Catppuccin)" → Other Actions → Set as Default**,
and **Appearance → General → Theme → Dark**. Open `nvim` once and plugins install themselves.

`install.sh` creates symlinks (`~/.config/nvim`, `~/.tmux.conf`, the iTerm2 profile), so editing
files in `~/dotfiles` changes your live config. Anything already in those spots is renamed to `*.backup`.

## Neovim

| Plugin | What it does |
|---|---|
| [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) | file explorer sidebar |
| [bufferline](https://github.com/akinsho/bufferline.nvim) | tab bar of open files |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | syntax highlighting |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + clangd | go to definition, hover docs, errors as you type |
| [blink.cmp](https://github.com/saghen/blink.cmp) | autocomplete popup |
| [catppuccin](https://github.com/catppuccin/nvim) | color scheme |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | `Ctrl-h/j/k/l` across nvim splits and tmux panes |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim) | git change markers, stage/undo changes, blame |
| [diffview](https://github.com/sindrets/diffview.nvim) | side-by-side diffs and file history |
| [render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim) | formatted markdown inside nvim |
| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code integration |

### Keys (leader is `\`)

| Key | Action |
|---|---|
| `Ctrl-n` | toggle file tree |
| `\e` | reveal current file in tree |
| `Shift-h` / `Shift-l` | previous / next tab |
| `\1`…`\5` | jump to tab |
| `\x` | close tab |
| `Ctrl-h/j/k/l` | move between splits / tmux panes |
| `gd` | go to definition (`Ctrl-o` to jump back) |
| `K` | hover docs |
| `grr` | find references |
| `\rn` | rename symbol |
| `\ca` | code action / quick fix |
| `\d` / `]d` / `[d` | show error / next / previous |
| `\h` | switch `.cpp` ↔ `.hpp` |
| `gf` | open file under cursor (works on `<iostream>` too) |
| `]c` / `[c` | next / previous git change |
| `\gp` | preview change |
| `\gs` / `\gr` | stage / undo change |
| `\gb` / `\gB` | blame line / toggle inline blame |
| `\gd` / `\gq` | open / close diff of all changes |
| `\gh` / `\gH` | history of this file / repo |
| `\m` | toggle markdown rendering |
| `\ac` | toggle Claude Code |

C++ projects without a `compile_commands.json` can add a `.clangd` file:

```yaml
CompileFlags:
  Add: [-std=c++17, -Wall, -Wextra]
```

## tmux

Prefix is `Ctrl-b`. Mouse on, vi copy mode, windows/panes numbered from 1.

| Key | Action |
|---|---|
| `prefix \|` / `prefix -` | split side by side / stacked |
| `prefix h/j/k/l` or `Ctrl-h/j/k/l` | move between panes |
| `prefix z` | zoom pane |
| `prefix r` | reload config |
| `prefix Ctrl-l` | clear screen (plain `Ctrl-l` is pane navigation) |
