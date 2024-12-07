{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./steam.nix
    ./1password.nix
    ./jetbrains-lib.nix
  ];

  environment.systemPackages = with pkgs; [
    home-manager
  ];
}
