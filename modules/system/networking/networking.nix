{ config, pkgs, userSettings, systemSettings, ... }:

{
  networking.hostName = "${systemSettings.hostname}"; 
  networking.networkmanager.enable = true;
}