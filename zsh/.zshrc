export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="apple"

zstyle ':omz:update' mode reminder

HIST_STAMPS="%d/%m/%Y"

plugins=(
  git
  zsh-autosuggestions
  fast-syntax-highlighting
  you-should-use
  brew
  copyfile
  macos
)

source "$ZSH/oh-my-zsh.sh"

[[ -f "$HOME/.config/zsh/paths.zsh" ]] && source "$HOME/.config/zsh/paths.zsh"
[[ -f "$HOME/.config/zsh/functions.zsh" ]] && source "$HOME/.config/zsh/functions.zsh"
[[ -f "$HOME/.config/zsh/aliases.zsh" ]] && source "$HOME/.config/zsh/aliases.zsh"

export YSU_IGNORED_ALIASES=(
  cls
  cl
  clera
  ckear
  clea
  cear
  cea
  ceat
  celat
  clear
)

ITERM2_SHELL_INTEGRATION="$HOME/.iterm2_shell_integration.zsh"

if [[ -e "$ITERM2_SHELL_INTEGRATION" ]]; then
  source "$ITERM2_SHELL_INTEGRATION"
fi

# wellcome messages
print -P "%F{cyan}󰍂  Last login: %F{yellow}$(date '+%a %b %d %H:%M:%S') %F{cyan}on %F{green}$(tty | xargs basename)%f"
print -P "%F{cyan}  Welcome back to %F{green} $(hostname)%F{cyan}, %F{yellow} $(whoami)%F{cyan}! Happy hacking :)%f"