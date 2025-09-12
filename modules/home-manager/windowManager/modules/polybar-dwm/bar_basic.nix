{ lib, config, pkgs, colors, ... }:

{
  monitor = "$\{env:MONITOR:\}";
  width = "100%";
  height = 50;
  dpi = 120;
  offset-x = 0;
  offset-y = 0;
  fixed-center = false;
  enable-ipc = true;

  background = "${colors.bg}";
  foreground = "${colors.fg}";

  line-size = 3;
  line-color = "#f00";

  border-size = 0;
  border-color = "${colors.bg-alt}";

  padding-left = 0;
  padding-right = 2;
  padding-top = 2;

  module-margin-left = 3;
  module-margin-right = 3;

  font-0 = "Comic Code NerdFont Mono:style=Regular:size=13;3";
  font-1 = "Symbols Nerd Font Mono:size=30;3";


  modules-left = "dwm";
  modules-center = "";
  modules-right = "pulseaudio wifi temperature battery date";

  override-redirect = "false";
  cursor-click = "pointer";
  cursor-scroll = "ns-resize";
}
