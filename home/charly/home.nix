{ config, lib, pkgs, ... }:

{
  home.username = lib.mkDefault "charly";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
    kitty
    wofi
    ashell
    unzip
    bitwarden-cli
    swww
    waypaper
  ];
  home.sessionVariables = {
  };

## Services
services.vdirsyncer.enable = true;


  # Let HM manage itself
  programs.home-manager.enable = true;
}
