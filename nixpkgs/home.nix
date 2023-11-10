{config, unstable, pkgs, ...}:

{
    fonts.fontconfig.enable = true;
    home.packages = with pkgs;[
      (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono"]; })
      bat
      neofetch
    ];
    home.stateVersion = "23.05";
    home.username = "baptiste.perrier";
    home.homeDirectory = "/home/baptiste.perrier";

    services.picom = import ./picom/picom.nix {};
    programs.alacritty = import ./alacritty/alacritty.nix pkgs;
    services.polybar = import ./polybar/polybar.nix pkgs;
    programs.zsh = import ./zsh/zsh.nix {};

}
