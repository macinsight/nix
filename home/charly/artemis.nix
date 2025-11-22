{ config, ... }: {
  imports = [
    ./home.nix
    ../common
    ../features/cli
    ../features/desktop
    ./dotfiles
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
      firefox.enable = true;
      thunderbird.enable = true;
    };
  };
}
