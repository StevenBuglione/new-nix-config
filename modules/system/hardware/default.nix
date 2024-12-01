{ inputs, config, pkgs, ... }:

{
  imports =
    [ 
      ./graphics.nix
      ./printing.nix
      ./sound.nix
    ];
}