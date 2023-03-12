#!/usr/bin/env zsh
##
## Zsh helpers
## This file contains helper functions for use in other scripts.
##


make-script() {
  # Check if the language and filename are provided
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: make-script <language> <filename>"
    return 1
  fi

  # Determine the shebang line based on the specified language
  case "$1" in
    "elixir")
      shebang="#!/usr/bin/env elixir"
      ;;
    "js")
      shebang="#!/usr/bin/env node"
      ;;
    "python")
      shebang="#!/usr/bin/env python"
      ;;
    "bash")
      shebang="#!/bin/bash"
      ;;
    *)
      echo "Invalid language: $1"
      return 1
  esac

  # Create the script file with the specified shebang line
  printf '%s\n\n' "$shebang" > "$2"
  chmod +x "$2"

  # Open the script file in the default editor at line 3 (after the shebang line)
  $EDITOR "+3" "$2"
}

docker-statsd-influxdb-grafana() {
  docker run --ulimit nofile=66000:66000 \
    -d \
    --rm \
    --name docker-statsd-influxdb-grafana \
    -p 3003:3003 \
    -p 3004:8888 \
    -p 8086:8086 \
    -p 8125:8125/udp \
    samuelebistoletti/docker-statsd-influxdb-grafana:latest
}

# This command is used to start a Docker container with a Bash shell. It uses
# fzf to provide an easy-to-use interactive interface for selecting the
# container.
docker-bash() {
  docker exec -i -t $(docker container ls --format "{{.Names}}" | fzf) /bin/bash
}

git-commit-fixup() {
  git commit -a --fixup $1
}

git-clean-fixup-from() {
  git rebase --autosquash --interactive $1
}

zsh-reload-config() {
  source ~/.zshrc
}

# This command is used to set the AWS_DEFAULT_PROFILE environment variable to
# the selected AWS profile from the ~/.aws/credentials file using the fzf fuzzy
# finder.
aws-profile() {
  export AWS_DEFAULT_PROFILE=$(cat ~/.aws/credentials | grep -o '\[[^]]*\]' | sed 's/^\[\(.*\)\]$/\1/' | fzf)
}

# This function deletes old Git branches that have been merged into master and
# removes stale remote-tracking branches to keep the local repository clean and
# tidy.
git-delete-old-branches() {
  git branch --merged master | grep -v master | grep -v staging | grep -v production | grep -v \* | grep -v + | xargs -n 1 git branch -d

  git prune

  git remote | xargs -n 1 git remote prune
}

grc() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative $1..HEAD
}

# This shell function sets the permissions for all files and directories in a
# given directory to standard values of 755 for directories and 644 for files.
# This can be useful for resetting modified permissions to standard values for
# security or compatibility reasons.
normalize-permission() {
  find $1 -type d -exec chmod 755 {} \; && find $1 -type f -exec chmod 644 {} \;
}

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

# This command allows you to interactively filter and select a Git branch from a
# list of all branches in the repository. The command uses fzf to provide an
# easy-to-use interactive interface, and color-coded output to help identify
# branch information. After selecting a branch, you can use it for further Git
# commands. This is a convenient way to manage Git branches and avoid typing out
# the branch name manually.

function fzfgb() {
  is_in_git_repo &&
    gb --all --color=always |
    awk '{ printf("\033[36m%s\033[0m ", $1); if ($2 == "*") { printf("\033[32m%s\033[0m ", "●"); } else { printf("%s ", " "); } printf("\033[33m%s\033[0m ", substr($3, 1, 2)); for(i=4;i<=NF;++i) printf("%s ", $i); print "" }' |
    fzf --height 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' |
    sed 's#^remotes/[^/]*/##'
}

zle -N fzfgb
bindkey '^gb' fzfgb

# This command updates the system's timezone based on the device's IP address
# location, with the ability to use custom IP address lookup services.
function timezone-dyn-update() {
  local ipapi_url="https://ipapi.co/timezone"
  local custom_url="${1:-$ipapi_url}"

  local timezone
  timezone="$(curl --fail "$custom_url" 2>/dev/null)"
  if [ $? -ne 0 ] || [ -z "$timezone" ]; then
    echo "Failed to retrieve timezone" >&2
    return 1
  fi

  echo "Detected timezone: ${timezone}"
  timedatectl set-timezone "$timezone" || {
    echo "Failed to set timezone" >&2
    return 1
  }
}
