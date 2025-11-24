{ config, lib, pkgs, ...}:

with lib;
let
  cfg = config.features.cli.rbw;
in
{
  options.features.cli.neofetch.enable = mkEnableOption "Enable rbw";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [rbw];
  };
}
