{ inputs, config, pkgs, ... }:

{
  imports =
    [ 
      ./localization.nix
      ./timezone.nix
    ];

}