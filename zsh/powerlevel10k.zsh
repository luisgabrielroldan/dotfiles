#!/usr/bin/env zsh
##
## Powerlevel10k zsh theme configuration
## This file contains configuration for the Powerlevel10k zsh theme.
##

# Load Powerlevel10k
if [[ -e "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ]]; then
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
else
  echo -e "\033[1;33mWARNING: Powerlevel10k is not detected!\033[0m"
fi
