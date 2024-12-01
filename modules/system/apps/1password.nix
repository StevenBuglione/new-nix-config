{ config, pkgs, userSettings, ... }:

{
  programs = {
    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = ["${userSettings.username}"];
    };
  };
}