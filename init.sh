#!/bin/sh
echo "Creating / updating needed channel and preparing nvim config"
nix-channel --add https://nixos.org/channels/nixos-22.11 nixos-stable
nix-channel --update

nix-env -iA nixos-stable.home-manager

git clone https://github.com/Babouche007/vimrc.git
ln -s ./vimrc/.vim ~/.vim

rm -rf ~/.config/nixpkgs
mkdir -p ~/.config/nixpkgs
cp -r ./nixpkgs/* ~/.config/nixpkgs/

echo "Installing home packages"
home-manager switch

