{ config, ... }: {
  imports = [
    ./home.nix
    ../common
    ../features/cli
  ];
  features = {
    cli = {
      fzf.enable = true;
      zsh.enable = true;
    };
  };
}
