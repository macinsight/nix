{pkgs, ...}: {
  programs.eza = {
    enable = true;
    extraOptions = ["-l" "--icons" "--git" "-a"];
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
  ];

}
