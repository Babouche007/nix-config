{config, unstable, pkgs, ...}:

{
	home.packages = with pkgs;[];
	home.stateVersion = "22.11";	
	home.username = "babouche";
	home.homeDirectory = "/home/babouche";

	programs.zsh = import ./zsh/zsh.nix {};
	services.picom = import ./picom/picom.nix {};
	programs.alacritty = import ./alacritty/alacritty.nix pkgs;
	services.polybar = import ./polybar/polybar.nix pkgs;

}
