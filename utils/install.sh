#!/usr/bin/env bash

dependencies=(git nvim node npm)

yes_or_no() {
    while true; do
        read -n 1 -p "$* [Y/n] " yn
        if [[ -z $yn ]]; then
            yn="y"
        else
            echo
        fi
        case $yn in
        [Yy]*)
            return 0
            ;;
        [Nn]*)
            echo "Aborted"
            return 1
            ;;
        esac
    done
}

# TODO: Support more distributions
install_package() {
    DISTRO=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
    case $DISTRO in
    ubuntu)
        COMMAND="apt install"
        ;;

    arch | artix)
        COMMAND="pacman -S"
        ;;

    *)
        echo -n "unknown"
        return 1
        ;;
    esac
    echo "> $COMMAND $1"
    echo "Enter root password:"
    su -c "$COMMAND $1"
}

check_dependencies() {
    uninstalled=()
    for dependency in "${dependencies[@]}"; do
        command -v $dependency >/dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "$dependency\tinstalled"
        else
            uninstalled+=($dependency)
        fi
    done
    if [[ ${#uninstalled[@]} -ne 0 ]]; then
        for package in "${uninstalled[@]}"; do
            echo -e "$package\tnot installed"
        done
        yes_or_no "Would you like to install the missing packages now?"
        if [[ $? -eq 1 ]]; then
            echo -e "Install the missing packages and run the script again."
            exit 1
        fi
        to_install=()
        case $package in
        nvim)
            to_install+=(neovim)
            ;;
        node)
            to_install+=(nodejs)
            ;;
        *)
            to_install+=($package)
            ;;
        esac
        install_package "${to_install[@]}"
    fi
}

install() {
    git clone https://github.com/grvxs/NVelox "$HOME/.config/nvim"
    mkdir "$HOME/.config/nvlx"
    touch "$HOME/.config/nvlx/init.lua"
}

backup() {
    yes_or_no "Do you want to backup to a custom directory?"
    if [[ $? -eq 0 ]]; then
        read -p "Enter a valid path: " DESTBAK
        eval mv -v $HOME/.config/nvim $DESTBAK
    elif [[ $? -eq 1 ]]; then
        echo "Backing up to the default backup directory (~/.config/nvim.bak)"
        mv -v $HOME/.config/nvim $HOME/.config/nvim.bak && mkdir $HOME/.config/nvim
    fi
    install
}

main() {
    check_dependencies
}

main
