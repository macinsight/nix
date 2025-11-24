{ inputs, ... }:
let
  configDirs = [
    "nvim"
    "kitty"
    "ashell"
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

