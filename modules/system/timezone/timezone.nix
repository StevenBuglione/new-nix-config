{
  config,
  pkgs,
  systemSettings,
  ...
}:

{
  time.timeZone = "${systemSettings.timezone}";
}
