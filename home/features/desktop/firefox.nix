{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.features.desktop.firefox;
in
{
  options.features.desktop.firefox.enable =
    mkEnableOption "firefox config";

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;

      profiles = {
        default = {
          id = 0;
          name = "default";
          bookmarks = {
            force = true;
            settings = [
              {
                name    = "wikipedia";
                tags    = [ "wiki" ];
                keyword = "wiki";
                url     = "https://wikipedia.org/";
              }
            ];
          };
        };
      };
    };
  };
}

