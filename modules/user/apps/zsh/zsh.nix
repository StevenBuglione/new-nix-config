{
  config,
  pkgs,
  userSettings,
  ...
}:

{
  programs.zsh = {
    enable = true;
    initExtra = builtins.readFile ./.zshrc;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };
    plugins = [
      {
        name = pkgs.zsh-autosuggestions.pname;
        src = pkgs.zsh-autosuggestions.src;
      }
      {
        name = pkgs.zsh-syntax-highlighting.pname;
        src = pkgs.zsh-syntax-highlighting.src;
      }
    ];
  };
}
