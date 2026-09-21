# Tool and terminal color theme (sourced from ~/.zshrc after Oh My Zsh).

# --- ls / eza ---
if command -v dircolors >/dev/null; then
  eval "$(dircolors -b)"
elif [[ -r "${HOME}/.dir_colors" ]]; then
  eval "$(dircolors -b "${HOME}/.dir_colors")"
fi

if command -v eza >/dev/null; then
  export EZA_COLORS="da=1;34:di=1;36:ln=1;35:so=1;33:pi=1;33:ex=1;32:bd=1;33;41"
  alias ls='eza --group-directories-first --color=always'
  alias ll='eza -al --group-directories-first --color=always'
  alias la='eza -a --group-directories-first --color=always'
  alias lt='eza --tree --level=2 --color=always'
fi

# --- bat (syntax-colored cat) ---
if command -v bat >/dev/null; then
  export BAT_THEME="${BAT_THEME:-TwoDark}"
  export BAT_STYLE="${BAT_STYLE:-numbers,changes,header}"
  alias cat='bat --paging=never'
  alias less='bat'
fi

# --- fzf palette (matches p10k rainbow / dark terminals) ---
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS}
  --color=fg:-1,bg:-1,hl:#5c7cfa,fg+:#e2e8f0,bg+:#1e293b
  --color=hl+:#7aa2f7,info:#94a3b8,prompt:#7dcfff,pointer:#bb9af7
  --color=marker:#9ece6a,spinner:#e0af68,header:#73daca"

# --- zsh-autosuggestions & syntax-highlighting ---
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240,italic'
typeset -g ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
typeset -g ZSH_HIGHLIGHT_STYLES[default]='none'
typeset -g ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
typeset -g ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow,bold'
typeset -g ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'
typeset -g ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=cyan,underline'
typeset -g ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
typeset -g ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
typeset -g ZSH_HIGHLIGHT_STYLES[command]='fg=green'
typeset -g ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,underline'
typeset -g ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=244'
typeset -g ZSH_HIGHLIGHT_STYLES[path]='fg=blue,underline'
typeset -g ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=blue,underline'
typeset -g ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta,bold'
typeset -g ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=blue,bold'
typeset -g ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=214'
typeset -g ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=214,bold'
typeset -g ZSH_HIGHLIGHT_STYLES[redirection]='fg=yellow,bold'
typeset -g ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=178'
typeset -g ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=178'
typeset -g ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=178'
typeset -g ZSH_HIGHLIGHT_STYLES[comment]='fg=244,italic'

# --- git aliases with color ---
if command -v git >/dev/null; then
  alias gs='git status -sb'
  alias gd='git diff'
  alias gdc='git diff --cached'
  alias gl='git log --oneline --graph --decorate --color=always -20'
  alias gll='git log --oneline --graph --decorate --color=always'
fi
