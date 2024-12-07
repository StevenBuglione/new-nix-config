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
      devcontainer
      direnv
      nodejs
      gh
      dotnetCorePackages.dotnet_9.sdk
      dotnetCorePackages.dotnet_9.runtime
    ];
  };

  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa"
    ];
  };

  programs.home-manager.enable = true;
}

# nix-collect-garbage -d
# nix-store --optimise
# nix-store --gc
