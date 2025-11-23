# Common configuration for all hosts

{ lib, inputs, outputs, pkgs,    ... }: {
  imports = [./users inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        "root"
        "charly"
      ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
    registry = (lib.mapAttrs (_: flake: { inherit flake; }))
      ((lib.filterAttrs (_: lib.isType "flake")) inputs);
    nixPath = [ "/etc/nix/path" ];
  };
  users.defaultUserShell = pkgs.zsh;
  services.udisks2.enable = true;
  
  ## Disable password requests for nixos-rebuild switch
  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = [ "charly" ];
        commands = [
          { command = "/run/current-system/sw/bin/nixos-rebuild"; options = [ "NOPASSWD" ]; }
        ];
      }
    ];
  };
}
