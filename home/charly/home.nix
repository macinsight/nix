{ config, lib, pkgs, ... }:

{
  home.username = lib.mkDefault "charly";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.packages = [];
  home.sessionVariables = {
  };

  # Let HM manage itself
  programs.home-manager.enable = true;
}
