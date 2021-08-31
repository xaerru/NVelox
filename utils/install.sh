#!/usr/bin/env bash

core_dependencies=(git nvim node npm pip3 rg)
DISTRO=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
CI=$1

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

install_core_dependencies() {
    COMMAND="sudo $1 "
    uninstalled=()
    echo "Core dependencies:"
    for dependency in "${core_dependencies[@]}"; do
        command -v $dependency >/dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "\t$dependency\tinstalled"
        else
            echo -e "\t$dependency\tnot installed"
            case $dependency in
            nvim)
                dependency="neovim"
                ;;
            node)
                dependency="nodejs"
                ;;
            pip3)
                case $DISTRO in
                ubuntu)
                    dependency="python3-pip"
                    ;;
                arch | artix)
                    dependency="python-pip"
                    ;;
                *)
                    echo -n "TODO"
                    exit 1
                    ;;
                esac
                ;;
            rg)
                dependency="ripgrep"
                ;;
            *)
                dependency=($dependency)
                ;;
            esac
            uninstalled+=($dependency)
        fi
    done
    if [[ ${#uninstalled[@]} -ne 0 ]]; then
        COMMAND+="${uninstalled[@]}"
        echo
        echo -e "\tThe following command is going to be executed as root:"
        echo -e "\t$ $COMMAND"
        yes_or_no "Continue with install?"
        if [ $? -eq 1 ]; then
            exit 1
        fi
        echo -e "\tEnter root password:"
        eval "$COMMAND"
    fi
}

install_extra_dependencies() {
    echo "Extra dependencies:"
    (pip3 list | grep neovim >/dev/null && echo -e "\tpynvim installed") || (echo "Installing pynvim" && pip3 install pynvim)
    (npm list --depth 1 --global neovim >/dev/null && echo -e "\tnode-client installed") || (echo "Installing node-client" && sudo npm install --global neovim)
}

# TODO: Support more distributions
install_packages() {
    case $DISTRO in
    ubuntu)
        install_core_dependencies "apt install"
        ;;

    arch | artix)
        install_core_dependencies "pacman -S"
        ;;

    *)
        echo -n "unknown"
        return 1
        ;;
    esac
    install_extra_dependencies
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
}

clone() {
    if [[ $CI == "--ci" ]]; then
        true
    else
        backup
    fi
    git clone https://github.com/grvxs/NVelox "$HOME/.config/nvim"
    if [ ! -d "$HOME/.config/nvlx/" ]; then
        mkdir "$HOME/.config/nvlx"
        touch "$HOME/.config/nvlx/init.lua"
    fi
    if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
        git clone https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
    fi
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}

main() {
    install_packages
    clone
}

main
