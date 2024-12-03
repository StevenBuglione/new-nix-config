{ inputs, config, pkgs, systemSettings, userSettings, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system/default.nix
    ];

  system.stateVersion = "24.11";
}
