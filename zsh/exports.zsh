#!/usr/bin/env zsh
##
## Zsh exports
## This file contains environment variables that need to be set.
##

# This sets the shell history options to ignore commands that start with a
# space or duplicate commands.
export HISTCONTROL=ignoreboth

# This sets the default user
export DEFAULT_USER=$(whoami)

# This adds the Java 7 JDK to the shell path.
export PATH="/usr/lib/jvm/default/bin:$PATH"

# This adds the Rust package manager, `cargo`, to the shell path.
export PATH="$PATH:~/.cargo/bin"

# This sets the default options for the `less` pager command.
export LESS="--quit-if-one-screen --no-init --RAW-CONTROL-CHARS"

# This sets the PostgreSQL user to `postgres`.
export PGUSER="postgres"
