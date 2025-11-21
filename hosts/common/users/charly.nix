{ config, pkgs, inputs, ...}:
{
  users.users.charly = {
    initialHashedPassword = "$y$j9T$cGyQIKS/KDXRHcvcXU0lQ1$BJC6hwZ/kOHdvL4.wDgaKxs.nwIXAoh.sn9jAv5di1D";
    isNormalUser = true;
    description = "The best hackeress on the planet";
    extraGroups = ["wheel" "networkmanager" "libvirtd" "audio" "video" "plugdev" "input" "kvm" "qemu-libvirtd"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ+hs6twq3oqBuxxnuTWY/IOGW8OF98tcKhXnAl7gsp0 charly@nixos"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.charly = import ../../home/charly/${config.networking.hostName}.nix;
}
