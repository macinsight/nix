{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.ashell;
in {
  options.features.desktop.ashell.enable = mkEnableOption "ashell config";

  config = mkIf cfg.enable {
    programs.ashell = {
      enable = true;
    };
  };
}
