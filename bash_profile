#!/usr/bin/env bash

export LANG=en_US.UTF-8

export TMPDIR="/tmp"

export PATH="$PATH:$HOME/.dotfiles/bin:$HOME/.dotfiles/bin_private"

export PATH="$PATH:$HOME/.local/bin"

[[ -f ~/.bashrc ]] && . ~/.bashrc

