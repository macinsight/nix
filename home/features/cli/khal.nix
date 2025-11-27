{ config, lib, pkgs, ...}:

with lib;
let
  cfg = config.features.cli.khal;
in
{
  options.features.cli.khal.enable = mkEnableOption "Enable khal";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [khal];
  };
}
