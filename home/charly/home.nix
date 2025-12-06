{ config, pkgs, ... }:

{ # HM Management Stuff
  home.username = "charly";
  home.homeDirectory = "/home/charly";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  programs.home-manager.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  # Package management
  home.packages = [
  ];
 programs.neovim = {
	 enable = true;
	 package = pkgs.neovim;
	 vimAlias = true;
	 vimdiffAlias = true;
	 withNodeJs = true;
 	plugins = with pkgs.vimPlugins; [
	lazy-nvim
	which-key-nvim
	];
	
  extraLuaConfig = ''
    vim.g.mapleader = " " -- Need to set leader before lazy for correct keybindings
    require("lazy").setup({
    spec = {
{ import = "plugins" },
    },
      performance = {
        reset_packpath = false,
        rtp = {
            reset = false,
          }
        },
      dev = {
        path = "${pkgs.vimUtils.packDir config.home-manager.users.charly.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
	patterns = {""},
      },
      install = {
        -- Safeguard in case we forget to install a plugin with Nix
        missing = false,
      },
    })
  '';
 };

 xdg.configFile."nvim/lua" = {
 recursive = true;
 soutce = ./lua;
 };
}
