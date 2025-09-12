{ pkgs, lib, config, ... }:

{
  options = {
    alacritty.enable = lib.mkEnableOption "Enable alacritty";
  };

  config = lib.mkIf config.alacritty.enable {
    programs.alacritty.enable = true;
    programs.alacritty.theme = "dark_plus";
    systemd.user.sessionVariables.TERMINAL = "alacritty";

    programs.alacritty.settings = {
      font = {
        size = 10;
        normal = {
          family = "Comic Code NerdFont Mono";
          style = "Regular" ;
        };
        italic = {
          family = "Comic Code NerdFont Mono";
          style = "Italic";
        };
        bold_italic = {
          family = "Comic Code NerdFont Mono";
          style = "Bold Italic";
        };
      };

      mouse.hide_when_typing = true;

      window.padding = {
        x = 2;
        y = 1;
      };

      keyboard.bindings = [
        {
          action = "IncreaseFontSize";
          key = "K";
          mods = "Alt|Shift";
        }
        {
          action = "DecreaseFontSize";
          key = "J";
          mods = "Alt|Shift";
        }
        {
          action = "Copy";
          key = "C";
          mods = "Alt";
        }
        {
          action = "Paste";
          key = "V";
          mods = "Alt";
        }
        {
          action = "ScrollLineUp";
          key = "K";
          mods = "Alt";
        }
        {
          action = "ScrollLineDown";
          key = "J";
          mods = "Alt";
        }
        {
          action = "ToggleViMode";
          key = "Escape";
          mods = "Alt";
        }
      ];
    };
  };
}
