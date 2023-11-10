#!/bin/sh
echo "Creating / updating needed channel and preparing nvim config"
nix-channel --add https://nixos.org/channels/nixos-23.05 nixos-stable
nix-channel --update
nix-env -iA nixos-stable.home-manager

rm -rf /home/baptiste.perrier/.config/nixpkgs
mkdir -p /home/baptiste.perrier/.config/nixpkgs
cp -r /home/baptiste.perrier/afs/nix-config/nixpkgs/* /home/baptiste.perrier/.config/nixpkgs/

echo "Installing home packages"
home-manager switch

echo "Installing oh_my-zsh"

sed -i 's#ZSH_THEME=".*"#ZSH_THEME="babouche"#g' /home/baptiste.perrier/.zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp /home/baptiste.perrier/afs/nix-config/nixpkgs/zsh/babouche.zsh-theme /home/baptiste.perrier/.oh-my-zsh/themes
killall .polybar-wrappe
polybar top
picom
