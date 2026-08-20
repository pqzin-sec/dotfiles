alias ip='ifconfig | awk '\''/^[a-z0-9]+:/{iface=$1; sub(":","",iface)} /inet /{print iface, $2}'\'''

alias cat='bat'
alias ls='eza --color=always --long --git --icons=always --no-filesize --group-directories-first'
alias home='cd ~'

alias cls='clear'
alias cl='clear'
alias clera='clear'
alias ckear='clear'
alias clea='clear'
alias cear='clear'
alias cea='clear'
alias ceat='clear'
alias celat='clear'

alias ds-clear='find . -type f -name "*.DS_Store" -delete'