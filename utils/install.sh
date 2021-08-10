#!/usr/bin/env bash

BOLD='\033[1m'
NORD='\033[1;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
END='\033[0m'
DEST="$HOME/.config/nvim"
URL="https://github.com/grvxs/NVelox"
set -e

clear
echo -e "${BOLD}${NORD}        _   ___    __     __          \n       / | / / |  / /__  / /___  _  __\n      /  |/ /| | / / _ \/ / __ \| |/_/\n     / /|  / | |/ /  __/ / /_/ />  <  \n    /_/ |_/  |___/\___/_/\____/_/|_| ${END}\n\n\n"

checknvim(){
    if command -v nvim >/dev/null; then
        echo -e "${BOLD}${RED} neovim is not installed please install it according to your distribution${END}"
        exit 1
    fi
}

function install(){
    if command -v git >/dev/null; then
        echo -e "\n${GREEN}[${END}${RED}*${RED}${GREEN}]${END} Installing\n"
        git clone $URL $DEST
        if [ ! -d "$HOME/.config/nvlx" ]; then
            mkdir ~/.config/nvlx && touch .config/nvlx/init.lua
        fi
    else
        echo -e "${BOLD}${RED}Command git not found${END}\n${RED}exiting!...${END}"
        exit 1
    fi
}

backup(){
    echo -e "\n\n${GREEN}[${END}${RED}*${RED}${GREEN}]${END} backing up"
    echo -e "\n${GREEN}[${END}${RED}*${RED}${GREEN}]${END} info"
    read -p "do you want to backup to a custom directory?[y/n]: " RESPONSE
    if [ "$RESPONSE" == "y" ]; then
        echo -e "\n${GREEN}[${END}${RED}*${RED}${GREEN}]${END} info"
        read -p "enter a valid path: " DESTBAK
        eval mv -v $HOME/.config/nvim $DESTBAK
    elif [ "$RESPONSE" == "n" ]; then
        echo -e "\n${GREEN}[${END}${RED}*${RED}${GREEN}]${END} info"
        echo "backing up to a default directory (~/.config/nvim.bak)"
        mv -v $HOME/.config/nvim $HOME/.config/nvim.bak && mkdir $HOME/.config/nvim
        install
    else
        echo "invalid argument specified! "
    fi

}


function checks(){
     if [ -d "$HOME/.config/nvim" ]
    then
        echo -e "\n${GREEN}[${END}${RED}*${RED}${GREEN}]${END} info\n"
        read -p "a previous neovim configuration was detected, do you want to backup your previous neovim configuration?[y/n]: " yn
        if [ "$yn" == "y" ]; then
            backup
        elif [ "$yn" == "n" ]; then
            exit 0
        else
            echo "invalid argument specified!"
        fi
    else
        install
    fi
}

function wrapper(){
    checknvim
    checks
    install
}

while true; do
    read -p "Do you want to install NVelox[y/n]: " yn
    case $yn in
        [y]* ) wrapper; break;;
        [n]* ) echo "OK! exiting..." && exit 0;;
        * ) echo "Invalid argument specified!" && exit 1;;
    esac
done

