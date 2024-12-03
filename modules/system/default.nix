{ inputs, config, pkgs, userSettings, systemSettings, ... }:

{
  imports =
    [ 
      ./apps/default.nix
      ./boot/default.nix
      ./feature/default.nix
      ./hardware/default.nix
      ./networking/default.nix
      ./timezone/default.nix
      ./users/sbuglione/sbuglione.nix
      ./wm/gnome.nix
    ];

}