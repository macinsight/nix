{ config, lib, ...}:
with lib; let
  cfg = config.features.desktop.thunderbird;
in {
  options.features.desktop.thunderbird.enable = mkEnableOption "thunderbird config";
  config = mkIf cfg.enable {
    programs.thunderbird = {
      enable = true;
      profiles."default" = {
        isDefault = true;
      };
      accounts.email.accounts.work.address = "hergemoeller@b1-systems.de";
    };
  };
}thunderbird
