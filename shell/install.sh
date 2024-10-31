#!/bin/bash

SOURCE_DIR=~/repo/mysway/shell

# Plug install
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

ln -sf "$SOURCE_DIR/.zshrc" ~/
ln -sf "$SOURCE_DIR/.aliases" ~/
ln -sf "$SOURCE_DIR/my-zsh-theme.zsh-theme" ~/.oh-my-zsh/custom/themes/

echo "~/.zshrc -> $SOURCE_DIR/.zshrc"
echo "~/.aliases -> $SOURCE_DIR/.aliases"
echo "~/.oh-my-zsh/custom/themes/my-zsh-theme.zsh-theme -> $SOURCE_DIR/my-zsh-theme.zsh-theme"
