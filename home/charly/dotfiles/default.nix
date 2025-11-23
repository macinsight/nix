{ inputs, ... }:
let
  configDirs = [
    "nvim"
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

