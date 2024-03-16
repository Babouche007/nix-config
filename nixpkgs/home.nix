{pkgs, lib, ...}:

let
  username = "baptiste.perrier";
  homeDirectory = "/home/baptiste.perrier";
  configHome = "${homeDirectory}/.config"

  defaultPkgs = with pkgs; [
    bat
  ]
in
{
  home = {
    inherit username homeDirectory
    stateVersion = "23.11";
    packages = defaultPkgs;

	programs.zsh = import ./zsh/zsh.nix {};
	services.picom = import ./picom/picom.nix {};
	programs.alacritty = import ./alacritty/alacritty.nix pkgs;
	services.polybar = import ./polybar/polybar.nix pkgs;
  }
}
