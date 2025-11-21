{config, lib, pkgs,...}: {
  with lib; let
  cfg = config.features.cli.zsh;
  in {
  options.features.cli.zsh.enable = mkEnableOption "Enable extended zsh configuration";
  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletions = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ls = "eza";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "agnoster";
      };
      };
    };
  };
}
