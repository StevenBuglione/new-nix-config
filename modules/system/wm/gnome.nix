{
  config,
  pkgs,
  userSettings,
  ...
}:

let
  monitorsXmlContent = builtins.readFile ./gnome-config/monitors.xml;
  monitorsConfig = pkgs.writeText "gdm_monitors.xml" monitorsXmlContent;
in
{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  systemd.tmpfiles.rules = [
    "L+ /run/gdm/.config/monitors.xml - - - - ${monitorsConfig}"
  ];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
