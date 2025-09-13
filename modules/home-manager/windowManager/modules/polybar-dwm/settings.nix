{ lib, config, pkgs, ... }:
let
  colors = {
    bg = "#1e1e1e";
    bg-alt = "#444";
    fg = "#D4D4D4";
    fg-alt = "#555";
    primary = "#1e1e1e";
    secondary = "#e60053";
    alert = "#bd2c40";
    trans = "#00000000";
  };

  bar_basic = import ./bar_basic.nix { lib = lib; config = config; pkgs = pkgs; colors = colors; };
  module_dwm = import ./module_dwm.nix { lib = lib; config = config; pkgs = pkgs; colors = colors; };
  module_temperature = import ./module_temperature.nix { lib = lib; config = config; pkgs = pkgs; colors = colors; };
  module_battery = import ./module_battery.nix { lib = lib; config = config; pkgs = pkgs; colors = colors; };
  module_date = import ./module_date.nix { lib = lib; config = config; pkgs = pkgs; colors = colors; };
  module_audio = import ./module_audio.nix { lib = lib; config = config; pkgs = pkgs; colors = colors; };
  module_wifi = import ./module_wifi.nix { lib = lib; config = config; pkgs = pkgs; colors = colors; };
in
{
  "bar/basic" = bar_basic;
  "module/dwm" = module_dwm;
  "module/pulseaudio" = module_audio;
  "module/wifi" = module_wifi;
  "module/temperature" = module_temperature;
  "module/battery" = module_battery;
  "module/date" = module_date;
  "settings" = {
    screenchange-reload = true;
    format-underline = "${colors.primary}";
    format-background = "${colors.bg}";
    radius = 15.0;
  };
}
