{ config, lib, ...}:
with lib; let
  cfg = config.features.desktop.thunderbird;
in {
  options.features.desktop.thunderbird.enable = mkEnableOption "thunderbird config";
  config = mkIf cfg.enable {
    programs.thunderbird = {
      enable = true;

  accounts.email.accounts."personal" = {
    address  = "hergemoeller@b1-systems.de";
    realName = "Jacob Hergemoeller";
    primary  = true;

    userName = "hergemoeller";
    # Use pass, gopass, kwallet, whatever:
    passwordCommand = "pass show mail/you@example.com";

    imap = {
      host = "imap.example.com";
      port = 993;
      tls  = true;
    };

    smtp = {
      host = "smtp.example.com";
      port = 587;
      tls  = true;
    };

    thunderbird = {
      enable   = true;
      profiles = [ "default" ]; # attach this account to the default profile
    };
  };


    };
  };
}




{ config, pkgs, ... }:

{
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird;
    profiles.default = {
      isDefault = true;
    };
  };

  accounts.email.accounts."personal" = {
    address  = "you@example.com";
    realName = "Your Name";
    primary  = true;

    userName = "you@example.com";
    # Use pass, gopass, kwallet, whatever:
    passwordCommand = "pass show mail/you@example.com";

    imap = {
      host = "imap.example.com";
      port = 993;
      tls  = true;
    };

    smtp = {
      host = "smtp.example.com";
      port = 587;
      tls  = true;
    };

    thunderbird = {
      enable   = true;
      profiles = [ "default" ]; # attach this account to the default profile
    };
  };
}

