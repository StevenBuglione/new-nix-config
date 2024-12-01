{ inputs, config, pkgs, ... }:

{
  imports =
    [
      ./steam.nix
      ./firefox.nix
      ./1password.nix
      ./jetbrains-lib.nix
    ];
}