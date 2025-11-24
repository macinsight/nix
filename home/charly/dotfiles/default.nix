{inputs, ...}: {
  home.file.".config/nvim" = {
    source = "${inputs.dotfiles}/nvim";
    recursive = true;
  };
    home.file.".config/ashell" = {
    source = "${inputs.dotfiles}/ashell";
    recursive = true;
  };
    home.file.".config/kitty" = {
    source = "${inputs.dotfiles}/kitty";
    recursive = true;
  };
  home.file.".config/wofi" = {
    source = "${inputs.dotfiles}/wofi";
    recursive = true;
  };

}

