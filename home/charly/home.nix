{ config, lib, pkgs, ... }:

{
  home.username = lib.mkDefault "charly";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.packages = [
    "kitty"
  ];
  home.sessionVariables = {
  };

  # Let HM manage itself
  programs.home-manager.enable = true;
}
