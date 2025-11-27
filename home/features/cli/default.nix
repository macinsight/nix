{pkgs, ...}: {
  imports = [./zsh.nix ./fzf.nix ./neofetch.nix ./khal.nix];
  programs.eza = {
    enable = true;
    extraOptions = ["-l" "--icons" "--git" "-a"];
    enableZshIntegration = true;
  };
  programs.bat = {enable=true;};
  home.packages = with pkgs; [
    coreutils
    fd
    htop
    jq
    procs
    ripgrep
    tldr
    zip
    khal
  ];

}
