{ config, lib, pkgs, ...}:

with lib;
let
  cfg = config.features.cli.neofetch;
in
{
  options.features.cli.neofetch.enable = mkEnableOption "Enable neofetch";

  config = mkIf cfg.enable {
    programs.neofetch = {
      enable = true;
    };
  };
}
