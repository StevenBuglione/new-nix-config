{
  config,
  pkgs,
  userSettings,
  ...
}:

{

  imports = [
    # Include the results of the hardware scan.
    ../../modules/user/apps/git/git.nix
    ../../modules/user/apps/ssh/ssh.nix
    ../../modules/user/apps/zsh/zsh.nix
    ../../modules/user/apps/kitty/kitty.nix
    ../../modules/user/apps/starship/starship.nix
    ../../modules/user/apps/fastfetch/fastfetch.nix
    ../../modules/user/apps/gnome/gnome.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  home = {
    username = "${userSettings.username}";
    homeDirectory = "/home/sbuglione";
    stateVersion = "24.05";

    packages = with pkgs; [
      just
      parted
      neovim
      curl
      xclip
      fastfetch
      bash-completion
      tree
      fontconfig
      zoxide
      fzf
      multitail
      bat
      trash-cli
      ripgrep
      helm
      kubectl
      xclip
      spotify
      jetbrains-toolbox
      podman-desktop
      dconf-editor
      postman
      go
      treefmt
      shfmt
      pre-commit
    ];
  };

  programs.home-manager.enable = true;
}
