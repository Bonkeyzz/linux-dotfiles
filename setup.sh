#!/bin/bash

# Move current zshrc to the home directory
cp zshrc ~/.zshrc

# Make a plugins folder
[ ! -d "/usr/share/zsh/plugins" ] && sudo mkdir /usr/share/zsh/plugins

# Install zsh-syntax-highlighting plugin
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting /usr/share/zsh/plugins/zsh-syntax-highlighting

# Install zsh-autosuggestions plugin
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh/plugins/zsh-autosuggestions

# Install zsh-abbr plugin
sudo git clone https://github.com/olets/zsh-abbr /usr/share/zsh/plugins/zsh-abbr

