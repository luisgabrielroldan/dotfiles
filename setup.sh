#!/usr/bin/env bash

ASDF_DIR="$HOME/.asdf"
ASDF_VERSION="v0.11.2"

SRC_DIR=$(dirname "$(realpath -s "$0")")

GREEN="\033[1m\033[1;32m"
RED="\033[1m\033[0;31m"
BLUE="\033[1;34m"
YELLOW="\033[1;33m"
RESET="\033[0m"

install() {
  src_path=$1
  dst_path=$2

  echo -n "    $dst_path "

  if [ -L "$dst_path" ]; then
    rm "$dst_path"
  elif [ -e "$dst_path" ]; then
    echo -e "${RED}ERROR${RESET} (Target path already exists)"
    return 1
  fi

  # check if parent directory of dst_path exists and create it if not
  parent_dir=$(dirname "$dst_path")
  if [ ! -d "$parent_dir" ]; then
    mkdir -p "$parent_dir"
  fi

  ln -s "$src_path" "$dst_path"
  echo -e "${GREEN}DONE${RESET}"
  return 0
}

install_files() {
  install $SRC_DIR/bashrc $HOME/.bashrc
  install $SRC_DIR/bash_profile $HOME/.bash_profile
  install $SRC_DIR/xprofile $HOME/.xprofile
  install $SRC_DIR/zshrc $HOME/.zshrc
  install $SRC_DIR/tmux.conf $HOME/.tmux.conf
  install $SRC_DIR/editorconfig $HOME/.editorconfig
  install $SRC_DIR/tmate.conf $HOME/.tmate.conf
  install $SRC_DIR/p10k.zsh $HOME/.p10k.zsh
  install $SRC_DIR/zsh $HOME/.zsh
  install $SRC_DIR/nvim $HOME/.config/nvim
  install $SRC_DIR/i3 $HOME/.config/i3
  install $SRC_DIR/rofi $HOME/.config/rofi
  install $SRC_DIR/alacritty $HOME/.config/alacritty
  install $SRC_DIR/borg/patterns.lst $HOME/.config/borg/patterns.lst
}

asdf_install() {
  echo -e -n "${BLUE}[*] Checking asdf...${RESET}"

  if ! command -v asdf &> /dev/null; then
    echo -e "\n${RED}[*] NOT INSTALLED${RESET}\n"
    read -p "Would you like to install asdf? (y/n): " choice
    case "$choice" in
      y|Y )
        git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch $ASDF_VERSION || exit 1
        ;;
      * )
        ;;
    esac
  else
    echo -e "${GREEN}INSTALLED${RESET}"
  fi
}

omz_install() {
  echo -e -n "${BLUE}[*] Checking oh-my-zsh...${RESET}"

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "\n${RED}[*] NOT INSTALLED${RESET}\n"
    read -p "Would you like to install oh-my-zsh? (y/n): " choice
    case "$choice" in
      y|Y )
        git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh || exit 1
        ;;
      * )
        ;;
    esac
  else
    echo -e "${GREEN}INSTALLED${RESET}"
  fi
}

create_directory() {
  echo -n "    $1 "

  if [ ! -d "$1" ]; then
    if ! mkdir -p "$1"; then
      echo -e "${RED}FAILED${RESET}"
      return 1
    fi
  fi

  echo -e "${GREEN}DONE${RESET}"
}

create_private_directories() {
  create_directory $SRC_DIR/bin_private
  create_directory $SRC_DIR/zsh/private
}

# ===================================
# Main
# ===================================

asdf_install

omz_install

echo -e "${BLUE}[*] Creating private directories...${RESET}"
create_private_directories


echo -e "${BLUE}[*] Installing dotfiles...${RESET}"
if ! install_files; then
  echo -e "${RED}[!] Failed to install${RESET}"
else
  echo -e "${GREEN}[*] Successfully installed${RESET}"
fi

