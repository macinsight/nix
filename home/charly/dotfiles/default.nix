{inputs, ...}: {
  home.file.".config/nvim" = {
    source = "${inputs.dotfiles}/nvim";
    recursive = true;
  };
    home.file.".config/ashell" = {
    source = "${inputs.dotfiles}/ashell";
    recursive = true;
  };

}

