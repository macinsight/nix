{pkgs, ...}: {
  imports = [
    ./wayland.nix
    ./hyprland.nix
    ./firefox.nix
    ./thunderbird.nix
  ];

  home.packages = with pkgs; [
  ];
}
