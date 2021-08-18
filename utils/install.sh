#!/usr/bin/env bash

dependencies=(git nvim node npm)

yes_or_no() {
    while true; do
        read -n 1 -p "$* [Y/n]: " yn
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
            exit 1
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
    echo "Enter root password:"
    su -c "$COMMAND $1"
}

check_command() {
    command -v $1 >/dev/null
    if [[ $? -eq 0 ]]; then
        echo -e "$1\tinstalled"
    else
        echo -e "$1\tnot installed"
        yes_or_no "Would you like to install $1 now?"
        case $1 in
        nvim)
            install_package neovim
            ;;
        node)
            install_package nodejs
            ;;
        *)
            install_package $1
            ;;
        esac
    fi
}

check_dependencies() {
    for dependency in "${dependencies[@]}"; do
        check_command $dependency
    done
}

check_dependencies
