#!/bin/bash

# Remove existing dotfiles
rm ~/.zshrc
rm ~/.config/.aliasrc

# Copy current zshrc to the home directory
cp zshrc ~/.zshrc

# Copy current aliasrc to the .config directory
cp aliasrc ~/.config/.aliasrc

PLUGINS_DIR="/usr/share/zsh/plugins"

# Make a plugins folder
[ ! -d "$PLUGINS_DIR" ] && sudo mkdir /usr/share/zsh/plugins

# Install zsh-syntax-highlighting plugin
[ ! -d "$PLUGINS_DIR/zsh-syntax-highlighting" ] && \
	sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting $PLUGINS_DIR/zsh-syntax-highlighting || echo "Plugin: zsh-syntax-highlighting is already installed."

# Install zsh-autosuggestions plugin
[ ! -d "$PLUGINS_DIR/zsh-autosuggestions" ] && \
	sudo git clone https://github.com/zsh-users/zsh-autosuggestions $PLUGINS_DIR/zsh-autosuggestions || echo "Plugin: zsh-autosuggestions is already installed."
