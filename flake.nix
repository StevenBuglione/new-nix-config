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
      system = "x86_64-linux"; 
      hostname = "mars"; 
      profile = "personal"; 
      timezone = "America/New_York"; 
      locale = "en_US.UTF-8"; 
      bootMode = "uefi"; 
      bootMountPath = "/boot"; 
      grubDevice = ""; 
      gpuType = "nvidia";
    };

    
    userSettings = rec {
      username = "sbuglione";
      name = "Steven Buglione";
      email = "stevenbuglione1@gmail.com";
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
