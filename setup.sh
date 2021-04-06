#!/bin/bash

echo "Installing ZSH stuff..."

# Remove existing dotfiles
rm ~/.zshrc
rm ~/.config/.aliasrc

# Copy current zshrc to the home directory
cp zshrc ~/.zshrc

# Copy current aliasrc to the .config directory
cp aliasrc ~/.config/.aliasrc

HOME_DIR="/home/$USER"

PLUGINS_DIR="/usr/share/zsh/plugins"

# Make a plugins folder
[ ! -d "$PLUGINS_DIR" ] && sudo mkdir /usr/share/zsh/plugins

# Install zsh-syntax-highlighting plugin
[ ! -d "$PLUGINS_DIR/zsh-syntax-highlighting" ] && \
	sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting $PLUGINS_DIR/zsh-syntax-highlighting || echo "Plugin: zsh-syntax-highlighting is already installed."

# Install zsh-autosuggestions plugin
[ ! -d "$PLUGINS_DIR/zsh-autosuggestions" ] && \
	sudo git clone https://github.com/zsh-users/zsh-autosuggestions $PLUGINS_DIR/zsh-autosuggestions || echo "Plugin: zsh-autosuggestions is already installed."

echo "Installing neovim stuff..."

# Neovim

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Make directory for vim plugins

VIM_PLUGGED="$HOME_DIR/.vim/plugged"
NVIM_CONFIG="$HOME_DIR/.config/nvim"
[ ! -d "$VIM_PLUGGED" ] && \
	mkdir -pv "$VIM_PLUGGED" || echo "Directory: $VIM_PLUGGED exists."
[ ! -d  "$NVIM_CONFIG" ] && \
	mkdir -pv "$NVIM_CONFIG" || echo "Directory $NVIM_CONFIG exists."

# Remove old vimrc
rm ~/.vimrc

# Copy init (that includes only the plugins to install) to home
cp init_plugins.vim ~/.vimrc

# Make a symlink
ln -sf "$HOME_DIR/.vimrc" "$NVIM_CONFIG/init.vim"

# Install all plugins
nvim -c PlugInstall

# Install the final config
# rm ~/.vimrc
cp init_final.vim ~/.vimrc

echo "*** Done! ***"
