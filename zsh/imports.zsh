#!/usr/bin/env zsh
##
## Zsh imports
## This file sources other zsh files.
##

################################################
## FZF
################################################

if [[ -d "/usr/share/fzf" ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
  source /usr/share/fzf/fzf-extras.bash
  source /usr/share/fzf/fzf-extras.zsh
fi


################################################
## ASDF config
################################################

if [[ -d "$HOME/.asdf" ]]; then
  source "$HOME/.asdf/asdf.sh"
  source "$HOME/.asdf/completions/asdf.bash"
fi

################################################
## LS_COLORS
################################################
if [[ -f "/usr/share/LS_COLORS/dircolors.sh" ]]; then
  source /usr/share/LS_COLORS/dircolors.sh
fi


################################################
## Load private scripts
################################################

PRIVATE_ZSH_FOLDER="$HOME/.zsh/private"

for file in $(ls -1 "$PRIVATE_ZSH_FOLDER" | sort); do
  if [[ -f "$PRIVATE_ZSH_FOLDER/$file" ]]; then
    source "$PRIVATE_ZSH_FOLDER/$file"
  fi
done


