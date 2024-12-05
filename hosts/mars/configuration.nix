{
  inputs,
  config,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/default.nix
  ];

  environment.systemPackages = [
    pkgs.nixd
    pkgs.nixfmt-rfc-style
  ];
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "24.11";
}
