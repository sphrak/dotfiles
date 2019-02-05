#!/bin/bash

dirs=(dunst i3 nvim rofi termite)
files=(.xinitrc .bashrc .gitconfig)
config=.config
dotfiles=~/.dotfiles
timestamp=$(date +%Y%M%d-%H%M%S)
backup=${config}/backup/$timestamp/

echo "Deploying dotfiles.."
cd ${dotfiles}
echo "Current directory is: $(pwd)"

function mkdir_backup() { 
    if [[ ! -d ~/${backup} ]]; then 
        mkdir -p ~/${backup}
    fi
}

function mkdir_config() {
    if [[ ! -d ${config} ]]; then
        echo "${config} missing. Creating it."
        mkdir -p ~/${config}
    fi
}

function ln_file() {
    ln -s ${dotfiles}/${file} ~/${file}
}

function ln_directory() {
    ln -s ${config}/${dir} ~/${config}/${dir}
}

mkdir_config

for file in ${files}; do
    echo "Symlinking ${file} to ~/${file}.."
    if [[ ! -e ~/${file} ]]; then
        ln_file
    else
        echo "File ${file} already exists. Moved original ${file} to ~/${backup}/${file}."
        if [[ ! -e ~/${backup}/ ]]; then
            echo "Backup directory missing. Creating it."
            mkdir_backup
        fi
        mv ~/${file} ~/${backup}/${file}
    fi
done

for dir in ${dirs}; do
    echo "Symlinking directory ${dir} to ~/${config}/${dir}/"

    if [[ ! -d ${config}/${dir} ]]; then
        ln_dir
    else
        echo "Folder ~/${config}/${dir} already exists. Moving ~/${config}/${dir} to ~/${backup}/${dir}"
        mv ~/${config}/${dir} ~/${backup}/
    fi
done

cd ~/
echo "Installation complete."
