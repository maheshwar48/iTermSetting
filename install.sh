#!/usr/bin/env bash
# Install dotfiles on macOS (Homebrew + Oh My Zsh + symlinks).
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
BACKUP_SUFFIX=".bak.$(date +%Y%m%d%H%M%S)"

log() { printf '==> %s\n' "$*"; }
warn() { printf 'warning: %s\n' "$*" >&2; }

backup_if_file() {
  local path="$1"
  if [[ -e "$path" && ! -L "$path" ]]; then
    mv "$path" "${path}${BACKUP_SUFFIX}"
    log "Backed up $path -> ${path}${BACKUP_SUFFIX}"
  elif [[ -L "$path" ]]; then
    rm -f "$path"
  fi
}

link_file() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  backup_if_file "$dest"
  ln -sf "$src" "$dest"
  log "Linked $dest -> $src"
}

if [[ "$(uname -s)" != Darwin ]]; then
  warn "This script targets macOS; adjust brew/cask steps for other OSes."
fi

if ! command -v brew >/dev/null; then
  echo "Homebrew is required. Install from https://brew.sh then re-run." >&2
  exit 1
fi

log "Installing CLI tools and fonts"
brew install zsh fzf zoxide eza bat
brew install --cask iterm2 \
  font-ubuntu font-ubuntu-mono \
  font-ubuntu-mono-nerd-font font-ubuntu-nerd-font

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  log "Installing Oh My Zsh"
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  log "Oh My Zsh already present"
fi

clone_if_missing() {
  local url="$1" dest="$2"
  if [[ -d "$dest/.git" ]]; then
    log "Already cloned: $dest"
  else
    log "Cloning $url"
    git clone --depth=1 "$url" "$dest"
  fi
}

clone_if_missing https://github.com/romkatv/powerlevel10k.git \
  "$ZSH_CUSTOM/themes/powerlevel10k"
clone_if_missing https://github.com/zsh-users/zsh-autosuggestions \
  "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
clone_if_missing https://github.com/Aloxaf/fzf-tab \
  "$ZSH_CUSTOM/plugins/fzf-tab"

log "Linking dotfiles from $DOTFILES"
link_file "$DOTFILES/zshrc" "$HOME/.zshrc"
link_file "$DOTFILES/p10k.zsh" "$HOME/.p10k.zsh"
link_file "$DOTFILES/zsh/tool-colors.zsh" "$HOME/.config/zsh/tool-colors.zsh"
if [[ -f "$DOTFILES/vim/vimrc" ]]; then
  link_file "$DOTFILES/vim/vimrc" "$HOME/.vimrc"
  mkdir -p "$HOME/.vim/colors"
  link_file "$DOTFILES/vim/colors/darcula.vim" "$HOME/.vim/colors/darcula.vim"
fi

if [[ ! -f "$HOME/.zshrc.local" && -f "$DOTFILES/zshrc.local.example" ]]; then
  cp "$DOTFILES/zshrc.local.example" "$HOME/.zshrc.local"
  log "Created ~/.zshrc.local from example (edit for this machine)"
fi

if command -v cursor >/dev/null; then
  log "Installing Cursor extensions (Darcula + Java)"
  cursor --install-extension rokoroku.vscode-theme-darcula 2>/dev/null || true
  cursor --install-extension vscjava.vscode-java-pack 2>/dev/null || true
fi

CURSOR_SETTINGS="$HOME/Library/Application Support/Cursor/User/settings.json"
MERGE_JSON="$DOTFILES/cursor/user-settings.merge.json"
if [[ -f "$MERGE_JSON" ]] && command -v python3 >/dev/null; then
  log "Merging Cursor font settings (if Cursor is installed)"
  python3 <<PY
import json
from pathlib import Path
merge = json.loads(Path("$MERGE_JSON").read_text())
path = Path("$CURSOR_SETTINGS")
path.parent.mkdir(parents=True, exist_ok=True)
if path.exists():
    data = json.loads(path.read_text())
else:
    data = {}
data.update(merge)
path.write_text(json.dumps(data, indent=4) + "\n")
print("Updated", path)
PY
fi

log "Done."
cat <<'EOF'

Next steps:
  1. iTerm: Settings → Profiles → Text → Font → UbuntuMonoNerdFontMono-Regular, 15pt
  2. Optional login shell: chsh -s "$(brew --prefix)/bin/zsh"
  3. Reload: exec zsh
  4. Vim: vi build.gradle (Darcula syntax in terminal)
  5. Edit ~/.zshrc.local for machine-specific paths and secrets

When ready for GHE:
  cd ~/Desktop/dotfiles && git init && git add . && git commit -m "Initial dotfiles"

EOF
