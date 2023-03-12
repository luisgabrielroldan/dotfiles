#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alF'

PS1='\[\033[1;33m\]\u@\h:\[\033[1;34m\]\w\[\033[0m\]\$ '

