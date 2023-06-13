#!/bin/bash

sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"

sudo apt install -y ripgrep
sudo apt install neovim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone github:luckslovez/astronvim_config ~/.config/nvim/lua/user
nvim --headless -c 'quitall'

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

git clone github:extrawurst/gitui ~/.gitui
cargo install --path ~/.gitui
