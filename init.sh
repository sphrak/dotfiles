#!/bin/bash

dirs=(dunst i3 nvim rofi termite)
files=(.xinitrc .bashrc .gitconfig)
config=.config
dotfiles=~/.dotfiles

echo "Deploying dotfiles..."
cd ${dotfiles}
echo "Current directory is: $(pwd)"

for file in ${files}; do
    echo "Symlinking ${file} to ~/${file}.."
    ln -s ${dotfiles}/${file} ~/${file}
done

for dir in ${dirs}; do
    echo "Symlinking directory ${dir} to ~/${config}/${dir}/"
    ln -s ${config}/${dir} ~/${config}/${dir}
done

cd ${HOME}
echo "Installation complete."
