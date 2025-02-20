# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

zstyle ':z4h:bindkey' keyboard  'mac'

zstyle ':z4h:' start-tmux      'yes' 

zstyle ':z4h:' prompt-at-bottom 'no'

zstyle ':z4h:' term-shell-integration 'yes'

zstyle ':z4h:autosuggestions' forward-char 'accept'

zstyle ':z4h:fzf-complete' recurse-dirs 'no'

# Enable direnv to automatically source .envrc files.
zstyle ':z4h:direnv'         enable 'no'
# Show "loading" and "unloading" notifications from direnv.
zstyle ':z4h:direnv:success' notify 'yes'

z4h init || return

# Extend PATH.
path=(~/bin $path)

# Export environment variables.
export GPG_TTY=$TTY

# Source additional local files if they exist.
z4h source ~/.env.zsh
z4h source ~/.zshwork

# Define key bindings.
z4h bindkey undo Ctrl+/   Shift+Tab  # undo the last command line change
z4h bindkey redo Option+/            # redo the last undone command line change

bindkey '^d' autosuggest-accept
bindkey '^d' autosuggest-execute

z4h bindkey z4h-cd-back    Shift+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Shift+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Shift+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Shift+Down   # cd into a child directory


# Autoload functions.
autoload -Uz zmv

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# Define aliases.
alias tree='tree -a -I .git'

# Override ls with lsd
alias ls='lsd'

# Override cat with bat
alias cat='bat'

# Clone a gitlab project from anywhere into ~/dev
alias clone='clone-gitlab.sh'

# Add flags to existing aliases.
alias ls="${aliases[ls]:-ls} -A"

# Shorter command for entering and exiting tmux
alias attach='tmux attach'
alias detach='tmux detach'

# Override vim with neovim
alias vim='nvim'

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

export NODE_EXTRA_CA_CERTS=/users/matthew.law/zscaler-root-ca.cer
export CURL_CA_BUNDLE=/users/matthew.law/zscaler-root-ca.cer

export NODE_REPL_HISTORY=""

PATH="$PATH":"$HOME/.config/.local/scripts/"

# opens tmux sessionizer
bindkey -s '^f' 'tmux-sessionizer\n'
bindkey -s '^V' 'nvim .^M'

# changes ctrl + L behaviour to clear
function clear-screen-and-scrollback() {
  builtin echoti civis >"$TTY"
  builtin print -rn -- $'\e[H\e[2J' >"$TTY"
  builtin zle .reset-prompt
  builtin zle -R
  builtin print -rn -- $'\e[3J' >"$TTY"
  builtin echoti cnorm >"$TTY"
}
zle -N clear-screen-and-scrollback
bindkey '^L' clear-screen-and-scrollback

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
