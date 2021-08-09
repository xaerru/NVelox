# A script to install NVelox nvim distro

welcome_msg () {
    printf "\033[1;34m _   ___     __   _\n"
    printf "| \\ | \\ \\   / /__| | _____  __\n"
    printf "|  \\| |\\ \\ / / _ \\ |/ _ \\ \\/ /\n"
    printf "| |\\  | \\ V /  __/ | (_) >  <\n"
    printf "|_| \\_|  \\_/ \\___|_|\\___/_/\\_\\ \n\033[0m"
    echo
}

info () {
    printf "\033[1;32m%s\033[0m\n" "$1"
}

error () {
    printf "\033[1;31m%s\033[0m\n" "$1"
}

msg () {
    printf "\033[1m%s\033[0m\n" "$1"
}

install_nvim () {
    info "Installing Neovim..."

    if [[ -f /bin/nvim ]]; then
        msg "Neovim already installed."
        return 0
    fi

    if  [[ -f /etc/os-release ]]; then
        source /etc/os-release
    fi
    
    case "$NAME" in 
        "Arch Linux" | "Artix Linux")
            pacman -S neovim
            ;;
        "Ubuntu" | "Debian GNU/Linux")
            apt install neovim
            ;;
        "Fedora")
            dnf install neovim
            ;;
    esac
    
    info "Neovim installed!"
}

backup () {
    info "Backing up your config files..."
    if [[ -d "$HOME"/.config/nvim ]]; then
        mv "$HOME"/.config/nvim "$HOME"/.config/nvim-pre
        info "Existing configuration moved to ~/.config/nvim-pre"
        return 0
    fi
}


welcome_msg
install_nvim

if [[ -d "$HOME"/.config/nvlx ]]; then
    msg "NVelox already installed!"
    exit 0
fi

backup

info "Downloading files..."

mkdir ~/.config/nvlx
touch ~/.config/nvlx/init.lua

git clone https://github.com/grvxs/NVelox ~/.config/nvim

info "NVelox installed succesfully!"

