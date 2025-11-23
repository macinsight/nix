{ inputs, ... }:
let
  configDirs = [
    "nvim"
    "waybar"
    "ashell"
    "kitty"
  ];

  mkConfigDir = name: {
    name = ".config/${name}";
    value = {
      source = "${inputs.dotfiles}/${name}";
      recursive = true;
    };
  };
in {
  home.file = builtins.listToAttrs (map mkConfigDir configDirs);
}

