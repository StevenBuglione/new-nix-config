{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./1password.nix
    ./jetbrains-lib.nix
  ];

  environment.systemPackages = with pkgs; [
    home-manager
  ];
}
