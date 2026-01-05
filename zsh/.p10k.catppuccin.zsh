# ------------------------------------------------------------
# Powerlevel10k overrides — Catppuccin Mocha
# Keep layout exactly as generated; change colors only.
# Source this AFTER ~/.p10k.zsh
# ------------------------------------------------------------

# --- Catppuccin Mocha palette (your variables) ---
typeset -g P10K_COLOR_BASE="#1e1e2e"   # Base
typeset -g P10K_COLOR_MANTLE="#181825" # Mantle
typeset -g P10K_COLOR_CRUST="#11111b"  # Crust

typeset -g P10K_COLOR_TEXT="#cdd6f4"     # Text
typeset -g P10K_COLOR_SUBTEXT1="#bac2de" # Subtext 1
typeset -g P10K_COLOR_SUBTEXT0="#a6adc8" # Subtext 0

typeset -g P10K_COLOR_OVERLAY2="#9399b2" # Overlay 2
typeset -g P10K_COLOR_OVERLAY1="#7f849c" # Overlay 1
typeset -g P10K_COLOR_OVERLAY0="#6c7086" # Overlay 0

typeset -g P10K_COLOR_SURFACE2="#585b70" # Surface 2
typeset -g P10K_COLOR_SURFACE1="#45475a" # Surface 1
typeset -g P10K_COLOR_SURFACE0="#313244" # Surface 0

typeset -g P10K_COLOR_BLUE="#89b4fa"      # Blue
typeset -g P10K_COLOR_LAVENDER="#b4befe"  # Lavender
typeset -g P10K_COLOR_SAPPHIRE="#74c7ec"  # Sapphire
typeset -g P10K_COLOR_SKY="#89dceb"       # Sky
typeset -g P10K_COLOR_TEAL="#94e2d5"      # Teal
typeset -g P10K_COLOR_GREEN="#a6e3a1"     # Green
typeset -g P10K_COLOR_YELLOW="#f9e2af"    # Yellow
typeset -g P10K_COLOR_PEACH="#fab387"     # Peach
typeset -g P10K_COLOR_RED="#f38ba8"       # Red
typeset -g P10K_COLOR_MAROON="#eba0ac"    # Maroon
typeset -g P10K_COLOR_PINK="#f5c2e7"      # Pink
typeset -g P10K_COLOR_FLAMINGO="#f2cdcd"  # Flamingo
typeset -g P10K_COLOR_ROSEWATER="#f5e0dc" # Rosewater
typeset -g P10K_COLOR_MAUVE="#cba6f7"     # Mauve

# Helper to emit zsh color escapes using hex.
# - %F{#rrggbb} sets foreground
# - %f resets to default
# These work in modern terminals (iTerm2/Kitty/WezTerm/etc).
_p10k_fg() { print -n -- "%F{$1}"; }
_p10k_reset() { print -n -- "%f"; }

# -----------------------
# Left: dir colors
# -----------------------
typeset -g POWERLEVEL9K_DIR_FOREGROUND=$P10K_COLOR_BLUE
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=$P10K_COLOR_SUBTEXT1
typeset -g POWERLEVEL9K_DIR_TRUNCATED_FOREGROUND=$P10K_COLOR_OVERLAY1
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=$P10K_COLOR_SKY

# -----------------------
# Prompt char (you already got this working, but set all vi states)
# -----------------------
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$P10K_COLOR_MAUVE
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$P10K_COLOR_RED

# -----------------------
# VCS: your config uses my_git_formatter() with hard-coded %76F etc.
# We override that function with identical logic but Catppuccin colors.
# -----------------------
function my_git_formatter() {
  emulate -L zsh

  if [[ -n $P9K_CONTENT ]]; then
    typeset -g my_git_format=$P9K_CONTENT
    return
  fi

  # "fresh" vs "stale" styles
  if (( $1 )); then
    local       meta="$(_p10k_fg $P10K_COLOR_OVERLAY1)"  # punctuation like # @ :
    local      clean="$(_p10k_fg $P10K_COLOR_GREEN)"     # branch + clean indicators
    local   modified="$(_p10k_fg $P10K_COLOR_PEACH)"     # staged/unstaged + wip
    local  untracked="$(_p10k_fg $P10K_COLOR_YELLOW)"    # untracked
    local conflicted="$(_p10k_fg $P10K_COLOR_RED)"       # conflicts/actions
  else
    local       meta="$(_p10k_fg $P10K_COLOR_OVERLAY0)"
    local      clean="$(_p10k_fg $P10K_COLOR_OVERLAY0)"
    local   modified="$(_p10k_fg $P10K_COLOR_OVERLAY0)"
    local  untracked="$(_p10k_fg $P10K_COLOR_OVERLAY0)"
    local conflicted="$(_p10k_fg $P10K_COLOR_OVERLAY0)"
  fi

  local res

  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
    (( $#branch > 32 )) && branch[13,-13]="…"
    res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branch//\%/%%}"
  fi

  if [[ -n $VCS_STATUS_TAG && -z $VCS_STATUS_LOCAL_BRANCH ]]; then
    local tag=${(V)VCS_STATUS_TAG}
    (( $#tag > 32 )) && tag[13,-13]="…"
    res+="${meta}#${clean}${tag//\%/%%}"
  fi

  [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] &&
    res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

  if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
    res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
  fi

  if [[ $VCS_STATUS_COMMIT_SUMMARY == (|*[^[:alnum:]])(wip|WIP)(|[^[:alnum:]]*) ]]; then
    res+=" ${modified}wip"
  fi

  if (( VCS_STATUS_COMMITS_AHEAD || VCS_STATUS_COMMITS_BEHIND )); then
    (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
    (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
    (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
  fi

  (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
  (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
  (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"

  (( VCS_STATUS_STASHES )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
  [[ -n $VCS_STATUS_ACTION ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
  (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
  (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
  (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
  (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
  (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

  # Reset at the end so we don't "leak" color into the next segment.
  res+="$(_p10k_reset)"

  typeset -g my_git_format=$res
}
functions -M my_git_formatter 2>/dev/null

# These are used only if p10k falls back to vcs_info (not gitstatus).
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$P10K_COLOR_GREEN
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$P10K_COLOR_YELLOW
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$P10K_COLOR_PEACH

# -----------------------
# Right prompt segment colors (foreground only)
# Map from your generated numeric palette to Mocha.
# -----------------------
typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=$P10K_COLOR_GREEN
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=$P10K_COLOR_RED
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=$P10K_COLOR_RED

typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=$P10K_COLOR_SKY
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=$P10K_COLOR_MAUVE

typeset -g POWERLEVEL9K_DIRENV_FOREGROUND=$P10K_COLOR_TEAL

typeset -g POWERLEVEL9K_ASDF_FOREGROUND=$P10K_COLOR_SAPPHIRE
typeset -g POWERLEVEL9K_ASDF_RUBY_FOREGROUND=$P10K_COLOR_PINK
typeset -g POWERLEVEL9K_ASDF_PYTHON_FOREGROUND=$P10K_COLOR_YELLOW
typeset -g POWERLEVEL9K_ASDF_GOLANG_FOREGROUND=$P10K_COLOR_SAPPHIRE
typeset -g POWERLEVEL9K_ASDF_NODEJS_FOREGROUND=$P10K_COLOR_GREEN
typeset -g POWERLEVEL9K_ASDF_RUST_FOREGROUND=$P10K_COLOR_PEACH
typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_FOREGROUND=$P10K_COLOR_MAUVE
typeset -g POWERLEVEL9K_ASDF_FLUTTER_FOREGROUND=$P10K_COLOR_SKY
typeset -g POWERLEVEL9K_ASDF_LUA_FOREGROUND=$P10K_COLOR_BLUE
typeset -g POWERLEVEL9K_ASDF_JAVA_FOREGROUND=$P10K_COLOR_RED
typeset -g POWERLEVEL9K_ASDF_PERL_FOREGROUND=$P10K_COLOR_LAVENDER
typeset -g POWERLEVEL9K_ASDF_POSTGRES_FOREGROUND=$P10K_COLOR_BLUE
typeset -g POWERLEVEL9K_ASDF_PHP_FOREGROUND=$P10K_COLOR_LAVENDER
typeset -g POWERLEVEL9K_ASDF_HASKELL_FOREGROUND=$P10K_COLOR_MAUVE

typeset -g POWERLEVEL9K_RBENV_FOREGROUND=$P10K_COLOR_PINK
typeset -g POWERLEVEL9K_RVM_FOREGROUND=$P10K_COLOR_PINK
typeset -g POWERLEVEL9K_PYENV_FOREGROUND=$P10K_COLOR_YELLOW
typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=$P10K_COLOR_YELLOW
typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND=$P10K_COLOR_YELLOW
typeset -g POWERLEVEL9K_GOENV_FOREGROUND=$P10K_COLOR_SAPPHIRE
typeset -g POWERLEVEL9K_NODENV_FOREGROUND=$P10K_COLOR_GREEN
typeset -g POWERLEVEL9K_NVM_FOREGROUND=$P10K_COLOR_GREEN
typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=$P10K_COLOR_GREEN

typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=$P10K_COLOR_BLUE
typeset -g POWERLEVEL9K_TERRAFORM_OTHER_FOREGROUND=$P10K_COLOR_MAUVE

typeset -g POWERLEVEL9K_AWS_DEFAULT_FOREGROUND=$P10K_COLOR_PEACH
typeset -g POWERLEVEL9K_AWS_EB_ENV_FOREGROUND=$P10K_COLOR_PEACH
typeset -g POWERLEVEL9K_AZURE_OTHER_FOREGROUND=$P10K_COLOR_BLUE
typeset -g POWERLEVEL9K_GCLOUD_FOREGROUND=$P10K_COLOR_BLUE
typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_FOREGROUND=$P10K_COLOR_BLUE

typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=$P10K_COLOR_RED
typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=$P10K_COLOR_SKY
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=$P10K_COLOR_SKY

