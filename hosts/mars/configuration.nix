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

  system.stateVersion = "24.11";
}
