#!/bin/sh
echo "Creating / updating needed channel and preparing nvim config"
nix-channel --add https://nixos.org/channels/nixos-22.05 nixos-stable
nix-channel --update

<<<<<<< HEAD
nix-env -iA nixos-unstable.home-manager

=======
nix-env -iA nixos-stable.home-manager

rm -rf ~/.config/nixpkgs
>>>>>>> 51815ef (fixing issues due to the use of unstable channel)
mkdir -p ~/.config/nixpkgs
cp -r ./nixpkgs/* ~/.config/nixpkgs/

echo "Installing home packages"
home-manager switch

