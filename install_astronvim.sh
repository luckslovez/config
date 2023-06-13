#!/bin/bash

PATHS_TO_DELETE=(~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim)

for path_to_delete in "${PATHS_TO_DELETE[@]}"; do
	echo "Deleting $path_to_delete..."
	rm -Rf $path_to_delete
done

echo "Done!"

ASTRONVIM_REPO="github:AstroNvim/AstroNvim"
echo "Installing AstroNvim from $ASTRONVIM_REPO in ~/.config/nvim"
git clone --depth 1 $ASTRONVIM_REPO ~/.config/nvim

# ASTRONVIM_CONFIG_REPO="https://github.com/AstroNvim/user_example"
ASTRONVIM_CONFIG_REPO="github:luckslovez/astronvim_config"
echo "Installing AstroNvim config from $ASTRONVIM_CONFIG_REPO in ~/.config/nvim/lua/user"
git clone $ASTRONVIM_CONFIG_REPO ~/.config/nvim/lua/user

echo "Running install command "
echo "nvim  --headless -c 'quitall'"
nvim --headless -c 'quitall'
