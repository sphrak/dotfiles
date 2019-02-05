#!/bin/bash

dirs=(dunst i3 nvim rofi termite)
files=(.xinitrc .bashrc .gitconfig)
config=.config
dotfiles=~/.dotfiles
timestamp=$(date +%Y%M%d-%H%M%S)
backup=.config/backup/$timestamp

echo "Deploying dotfiles.."
cd ${dotfiles}
echo "Current directory is: $(pwd)"

function mkdir_backup() {
    echo "Backup directory missing. Creating it."
    if [[ ! -d ~/${backup} ]]; then 
        mkdir -p ~/${backup}
    fi
}

function mkdir_config() {
    if [[ ! -d .config ]]; then
        echo ".config missing. Creating it."
        mkdir -p ~/.config
    fi
}

function ln_file() {
    ln -s ${dotfiles}/${file} ~/${file}
}

function ln_directory() {
    ln -s ${dotfiles}/${dir} ${dotfiles}/.config/${dir}
}

mkdir_config

for file in ${files[@]}; do
    echo "Symlinking ${file} to ~/${file}.."
    if [[ ! -f ~/${file} ]]; then
        ln_file
    else
        echo "File ${file} already exists. Moved original ${file} to ~/${backup}/${file}"
        mkdir_backup
        mv ~/${file} ~/${backup}/${file}
        ln_file
    fi
done

for dir in ${dirs[@]}; do
    echo "Symlinking directory ${dir} to ~/.config/${dir}/"
    if [[ ! -d ~/.config/${dir} && ! -L ~/.config/${dir} ]]; then
        ln_directory
    else
        echo "Folder ~/.config/${dir} already exists. Moving ~/.config/${dir} to ~/${backup}/${dir}"
        if [[ -L ~/.config/${dir} ]]; then
            rm ~/.config/${dir}
        else
            mv ~/.config/${dir} ~/${backup}/
        fi
        ln_directory
    fi
done

cd ~/
echo "Installation complete."
