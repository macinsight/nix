{pkgs, ...}: {
  imports = [
    ./wayland.nix
    ./hyprland.nix
    ./firefox.nix
  ];

  home.packages = with pkgs; [
  ];
}
