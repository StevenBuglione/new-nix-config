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
      vim
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
      kubernetes-helm
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
      devcontainer
      gh
      rpi-imager
      ptyxis
      cmake
      clang
      zig
      zls
    ];
  };

  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa"
    ];
  };

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    bash.enable = true; # see note on other shells below
  };

  programs.home-manager.enable = true;
}

# nix-collect-garbage -d
# nix-store --optimise
# nix-store --gc
