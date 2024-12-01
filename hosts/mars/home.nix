{ config, pkgs, userSettings, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ../../modules/user/apps/git/git.nix
      ../../modules/user/apps/ssh/ssh.nix
    ];
  
  nixpkgs.config = {
    allowUnfree = true;
  };

  home = {
    username = "${userSettings.username}";
    homeDirectory = "/home/sbuglione";
    stateVersion = "24.05";

    packages = with pkgs; [
      gnomeExtensions.emoji-copy
      gnomeExtensions.blur-my-shell
      gnomeExtensions.gsconnect
      gnomeExtensions.dash-to-dock
      just
      parted
      neovim
      curl
      xclip
      fastfetch
      bash-completion
      tree
      fontconfig
      starship
      zoxide
      fzf
      multitail
      bat
      trash-cli
      ripgrep
      helm
      kubectl
    ];

    file = {
      ".bashrc".source = ../../modules/user/apps/bash/.bashrc;
      ".config/fastfetch/config.jsonc".source = ../../modules/user/apps/fastfetch/config.jsonc;
      ".config/starship.toml".source = ../../modules/user/apps/starship/starship.toml;
      ".config/kitty/kitty.conf".source = ../../modules/user/apps/kitty/kitty.conf;
      ".local/share/fonts/JetbrainsMono".source = ../../modules/user/apps/fonts/JetbrainsMono;
      ".zshrc".source = ../../modules/user/apps/zsh/.zshrc;
      ".oh-my-zsh/custom/plugins/zsh-autosuggestions".source = ../../modules/user/apps/zsh/plugins/zsh-autosuggestions;
      ".oh-my-zsh/custom/plugins/zsh-syntax-highlighting".source = ../../modules/user/apps/zsh/plugins/zsh-syntax-highlighting;
      ".oh-my-zsh/custom/plugins/zsh-bat".source = ../../modules/user/apps/zsh/plugins/zsh-bat;
    };
  };

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

  programs.home-manager.enable = true;
}
