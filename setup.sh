#!/bin/bash

HOME_DIR="/home/$USER"
PLUGINS_DIR="/usr/share/zsh/plugins"

echo "[!] Installing ZSH and tmux..."
sudo pacman -Sy zsh tmux

# Remove existing dotfiles
rm ~/.zshrc
rm ~/.config/.aliasrc

# Copy current zshrc to the home directory
cp zshrc ~/.zshrc

# Copy current aliasrc to the .config directory
cp aliasrc ~/.config/.aliasrc

# Make a plugins folder
[ ! -d "$PLUGINS_DIR" ] && sudo mkdir /usr/share/zsh/plugins

# Install zsh-syntax-highlighting plugin
[ ! -d "$PLUGINS_DIR/zsh-syntax-highlighting" ] && \
	sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting $PLUGINS_DIR/zsh-syntax-highlighting || echo "Plugin: zsh-syntax-highlighting is already installed."

# Install zsh-autosuggestions plugin
[ ! -d "$PLUGINS_DIR/zsh-autosuggestions" ] && \
	sudo git clone https://github.com/zsh-users/zsh-autosuggestions $PLUGINS_DIR/zsh-autosuggestions || echo "Plugin: zsh-autosuggestions is already installed."


function change_shell() {
  read -p "[!] Do you want to change the default shell to zsh? (y/n) " iyn

  case $iyn in
    [yY] ) chsh -s "/usr/bin/zsh";;
    [nN] ) echo "[!] Shell will not be changed.";;
      * ) echo "[*] Invalid response.";
      change_shell;;
  esac
}

change_shell

echo "[!] Installing NVim..."

sudo pacman -Syu neovim

echo "[!] Copying NVim config files/plugins..."

# Neovim

[ -d "$HOME_DIR/.config/nvim" ] && \
  echo "[!] Backing up old nvim config..." \
  cp -r $HOME_DIR/.config/nvim $HOME_DIR/.config/nvim_backup

echo "[!] Copying current NVim config/plugins..."
cp -r nvim/ $HOME_DIR/.config/

echo "[!] Installing required language componente for neovim.."
sudo pacman -Sy base-devel git wget tree-sitter-cli ripgrep unzip python python-pip nodejs npm composer luarocks rust clang lua-language-server ruby julia go jdk-openjdk

clear
echo "[!] Done!"
