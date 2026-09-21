# Portable zsh config (dotfiles). Machine-specific: ~/.zshrc.local
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
  git
  docker
  kubectl
  colored-man-pages
  copypath
  copyfile
  dirhistory
  sudo
  fzf
  fzf-tab
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
)

source $ZSH/oh-my-zsh.sh

# --- Interactive shell (history, navigation, completion) ---
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'command -v eza >/dev/null && eza --color=always $realpath || ls -G $realpath 2>/dev/null'

export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:---height 40% --layout=reverse --border --bind=ctrl-/:toggle-preview}"

if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
  alias j='z'
fi

[[ -r "${HOME}/.config/zsh/tool-colors.zsh" ]] && source "${HOME}/.config/zsh/tool-colors.zsh"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Secrets, work paths, completions — keep on each machine only (see zshrc.local.example)
[[ -f "${HOME}/.zshrc.local" ]] && source "${HOME}/.zshrc.local"
