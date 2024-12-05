{ config, pkgs, ... }:

{
  # Enable Fastfetch
  programs.fastfetch = {
    enable = true;

    # Fastfetch configuration settings
    settings = {
      # Schema URL for validation and reference
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      # Logo configuration
      logo = {
        type = "builtin";
        color = {
          "1" = "white";
          "2" = "cyan";
        };
      };

      # Display settings
      display = {
        separator = "   ";
        color = "cyan";
      };

      # Modules to display in Fastfetch
      modules = [
        {
          type = "custom";
          # Hardware Information Header
          format = "┌─────────── Hardware Information ───────────┐";
        }
        {
          type = "host";
          key = "  󰌢";
        }
        {
          type = "cpu";
          key = "  ";
        }
        {
          type = "gpu";
          detectionMethod = "pci";
          key = "  ";
        }
        {
          type = "display";
          key = "  󱄄";
        }
        {
          type = "memory";
          key = "  ";
        }
        {
          type = "custom";
          # Software Information Header
          format = "├─────────── Software Information ───────────┤";
        }
        {
          type = "os";
          key = "  ";
          # You can customize the OS logo by using icons from nerdfonts.com
        }
        {
          type = "kernel";
          key = "  ";
          format = "{1} {2}";
        }
        {
          type = "wm";
          key = "  ";
        }
        {
          type = "shell";
          key = "  ";
        }
        {
          type = "custom";
          # Uptime and Age Header
          format = "|────────────── Uptime / Age ────────────────|";
        }
        {
          type = "command";
          key = "  OS Age ";
          keyColor = "magenta";
          # Shell command to calculate OS age in days
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "uptime";
          key = "  Uptime ";
          keyColor = "magenta";
        }
        {
          type = "custom";
          # Information End Footer
          format = "└────────────────────────────────────────────┘";
        }
        {
          type = "colors";
          paddingLeft = 2;
          symbol = "circle";
        }
      ];
    };
  };
}
