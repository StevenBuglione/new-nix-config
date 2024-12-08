{
  config,
  pkgs,
  userSettings,
  ...
}:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.displayManager.autoLogin.enable = true; # Enable automatic login for the user.
  services.displayManager.autoLogin.user = "${userSettings.username}";

  systemd.services."getty@tty1".enable = false; # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."autovt@tty1".enable = false;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
