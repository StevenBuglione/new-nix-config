{ pkgs, ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
        tiling-shell.extensionUuid
        system-monitor.extensionUuid
      ];
    };
    "org/gnome/desktop/wm/preferences" = {
      "button-layout" = ":minimize,maximize,close";
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    system-monitor
    blur-my-shell
    tiling-shell
  ];
}
