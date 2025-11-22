{ config, ... }: {
  imports = [
    ./home.nix
    ../common
    ../features/cli
    ../features/desktop
  ];
  features = {
    cli = {
      fzf.enable = true;
      zsh.enable = true;
      neofetch.enable = true;
    };
    desktop = {
      wayland.enable = true;
      hyprland.enable = true;
    };
  };
}
