# dotfiles (zsh + Powerlevel10k)

Portable macOS setup: rainbow **Powerlevel10k** prompt, **Oh My Zsh** plugins, **fzf** / **zoxide** / **eza** / **bat**, Ubuntu fonts, **Cursor Darcula** + **Vim Darcula** syntax in the terminal.

## Quick install (new Mac)

```bash
cd ~/Desktop/dotfiles   # or wherever you cloned this repo
chmod +x install.sh
./install.sh
exec zsh
```

`install.sh` installs Homebrew packages, Oh My Zsh (if missing), theme/plugins, symlinks configs, links **Vim** + **Darcula** colorscheme, installs Cursor extensions, merges Cursor settings, and creates `~/.zshrc.local` from the example.

## Layout

| Path | Installed as |
|------|----------------|
| `zshrc` | `~/.zshrc` |
| `p10k.zsh` | `~/.p10k.zsh` |
| `zsh/tool-colors.zsh` | `~/.config/zsh/tool-colors.zsh` |
| `vim/vimrc` | `~/.vimrc` |
| `vim/colors/darcula.vim` | `~/.vim/colors/darcula.vim` (IntelliJ-like `vi`/`vim` colors) |
| `zshrc.local.example` | copied once to `~/.zshrc.local` (gitignored on your machine) |
| `cursor/user-settings.merge.json` | merged into Cursor `settings.json` (IntelliJ **Darcula** theme) |
| `cursor/extensions.json` | optional: copy to a project `.vscode/extensions.json` for recommendations |
| `iterm/SETUP.md` | iTerm font steps |

Machine-specific stuff (tokens, `boundary` completion, Bao, etc.) belongs only in **`~/.zshrc.local`**, not in this repo.

## Publish to GHE (when ready)

```bash
cd ~/Desktop/dotfiles
git init
git add .
git commit -m "Initial dotfiles"
git remote add origin git@ghe.megaleo.com:YOUR_ORG/dotfiles.git
git push -u origin main
```

On another machine:

```bash
git clone git@ghe.megaleo.com:YOUR_ORG/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

## Updating this Mac to use the package

If you already maintain `~/.zshrc` by hand, back up then:

```bash
~/Desktop/dotfiles/install.sh
```

Copy any personal blocks from your old `~/.zshrc` into `~/.zshrc.local`.

## Prompt notes

- **Round** segments use powerline glyphs → terminal font must be **Ubuntu Mono Nerd** (see `iterm/SETUP.md` and Cursor merge JSON).
- Segment **icons** use emoji/Unicode (no Nerd icon font required for those).
- No **iTerm** badge on the right (only agent / Claude / Cursor when applicable).
