{ config, lib, pkgs, ... }:

{
  home.username = lib.mkDefault "charly";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
    kitty
    wofi
  ];
  home.sessionVariables = {
  };

  # Let HM manage itself
  programs.home-manager.enable = true;
}
