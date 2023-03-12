#!/usr/bin/env zsh
##
## Zsh oh-my-zsh configuration
## This file contains configuration for oh-my-zsh.
##
#
export ZSH=~/.oh-my-zsh

plugins=(
  aws                  # Provides command-line completion for AWS CLI.
  archlinux            # Adds aliases and functions for Arch Linux.
  asdf                 # Adds command-line completions for the asdf version manager.
  cp                   # Provides extended file copy functionality.
  docker               # Adds aliases and functions for Docker CLI.
  docker-compose       # Adds aliases and functions for Docker Compose CLI.
  git                  # Provides many useful aliases and functions for Git.
  git-extras           # Adds many useful Git commands.
  gitfast              # Provides Git command-line completion.
  jsontools            # Adds command-line tools for working with JSON.
  mix                  # Adds command-line completions for the Elixir build tool.
  sudo                 # Provides aliases for the `sudo` command.
  tmux                 # Adds many useful aliases and functions for tmux.
  yarn                 # Adds command-line completions for the Yarn package manager.
  zsh-autosuggestions  # Provides suggestions as you type based on command history.
  z                    # Provides enhanced directory navigation capabilities.
)

source $ZSH/oh-my-zsh.sh
