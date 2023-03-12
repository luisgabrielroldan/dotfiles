#!/usr/bin/env zsh
##
## Zsh aliases
## This file contains various aliases for commonly used commands.
##

# Unsets the v function created by fzf-extras
unset -f v
alias v="$EDITOR"

alias c="clear"
alias cdd="cd ~/Dev"

##
## Keyboard layouts
##

alias kb-us="setxkbmap -layout us"
alias kb-us-intl="setxkbmap -layout us -variant intl"
alias kb-ru="setxkbmap -layout ru"
alias kb-ara="setxkbmap -layout ara"
alias kb-tel="setxkbmap -layout tel"

##
## NordVPN
##

alias nvpnc="nordvpn connect"
alias nvpnd="nordvpn disconnect"
alias nvpndnshome="nordvpn set dns 192.168.10.8"
alias nvpndnsoff="nordvpn set dns off"
