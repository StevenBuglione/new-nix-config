{
  config,
  pkgs,
  userSettings,
  ...
}:

{
  users.users."${userSettings.username}" = {
    isNormalUser = true;
    description = "${userSettings.name}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
    packages =
      with pkgs;
      [
      ];
  };

  programs.zsh.enable = true;
}
