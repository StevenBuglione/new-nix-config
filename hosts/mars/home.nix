{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../../modules/user/apps/git/git.nix
    ];
  home.username = "sbuglione";
  home.homeDirectory = "/home/sbuglione";
  
  nixpkgs.config = {
    allowUnfree = true;
  };

  home.stateVersion = "24.05"; 
  
  home.packages = [
    pkgs.just
    pkgs.parted
    pkgs.neovim
    pkgs.curl
    pkgs.xclip
    pkgs.fastfetch
    pkgs.bash-completion
    pkgs.tree
    pkgs.fontconfig
    pkgs.starship
    pkgs.zoxide
    pkgs.fzf
    pkgs.multitail
    pkgs.bat
    pkgs.trash-cli
    pkgs.ripgrep
    pkgs.helm
    pkgs.kubectl
  ];
  
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git"];
      };
    };
	};


  home.file = {
    ".bashrc".source = ../../modules/user/apps/bash/.bashrc;
    ".config/fastfetch/config.jsonc".source = ../../modules/user/apps/fastfetch/config.jsonc;
    ".config/starship.toml".source = ../../modules/user/apps/starship/starship.toml;
    ".config/kitty/kitty.conf".source = ../../modules/user/apps/kitty/kitty.conf;
    ".local/share/fonts/JetbrainsMono".source = ../../modules/user/apps/fonts/JetbrainsMono;
    ".ssh/config".source = ../../modules/user/apps/ssh/config;
    ".zshrc".source = ../../modules/user/apps/zsh/.zshrc;
    ".oh-my-zsh/custom/plugins/zsh-autosuggestions".source = ../../modules/user/apps/zsh/plugins/zsh-autosuggestions;
    ".oh-my-zsh/custom/plugins/zsh-syntax-highlighting".source = ../../modules/user/apps/zsh/plugins/zsh-syntax-highlighting;
    ".oh-my-zsh/custom/plugins/zsh-bat".source = ../../modules/user/apps/zsh/plugins/zsh-bat;
  };

  
  home.sessionVariables = {
    # EDITOR = "emacs";
  };


  programs.home-manager.enable = true;
}
