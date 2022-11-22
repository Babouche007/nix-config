{config, unstable, pkgs, ...}:

{
	home.packages = with pkgs;[];

	programs.zsh = import ./zsh/zsh.nix {};
	services.picom = import ./picom/picom.nix {};
	programs.alacritty = import ./alacritty/alacritty.nix pkgs;
	services.polybar = import ./polybar/polybar.nix pkgs;

}
