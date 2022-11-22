{config, unstable, pkgs, ...}:

let
unstable = import <nixos-unstable> {config = {allowUnfree = true; }; };
in
{
	home.packages = with pkgs;[];

	programs.zsh = import ./zsh/zsh.nix {};
#	programs.picom = import ./picom/picom.nix {};
	programs.alacritty = import ./alacritty/alacritty.nix pkgs;
#	programs.polybar = import ./polybar/polybar.nix pkgs;

}
