{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    systemSettings = {
      system = "x86_64-linux"; # system arch
      hostname = "mars"; # hostname
      profile = "personal"; # select a profile defined from my profiles directory
      timezone = "America/New_York"; # select timezone
      locale = "en_US.UTF-8"; # select locale
      bootMode = "uefi"; # uefi or bios
      bootMountPath = "/boot"; # mount path for efi boot partition; only used for uefi boot mode
      grubDevice = ""; # device identifier for grub; only used for legacy (bios) boot mode
      gpuType = "amd"; # amd, intel or nvi
    };

    
    userSettings = rec {
      username = "sbuglione"; # username
      name = "Steven Buglione"; # name/identifier
      email = "stevenbuglione1@gmail.com"; # email (used for certain configurations)
    };

    system = "${systemSettings.system}";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in
  {

  nixosConfigurations = {
    mars = nixpkgs.lib.nixosSystem {
      specialArgs = 
        { 
          inherit inputs; 
          inherit system; 
          inherit systemSettings;
          inherit userSettings;
        };
      modules = [
      ./hosts/mars/configuration.nix
      ];
     };
   };

  homeConfigurations = {
    user = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./hosts/mars/home.nix
      ];
      extraSpecialArgs = {
        inherit systemSettings;
        inherit userSettings;
        inherit inputs;
      };
    };
  };
  };
}
