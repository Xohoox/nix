{ lib, config, pkgs, colors, ... }:

{
  monitor = "$\{env:MONITOR:\}";
  width = "100%";
  height = "3%";
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
  padding-top = 1;
  padding-bottom = 1;

  module-margin-left = 2;
  module-margin-right = 2;

  font-0 = "Comic Code NerdFont Mono:style=Regular:size=18;";

  modules-left = "dwm";
  modules-center = "";
  modules-right = "wifi pulseaudio temperature battery date";

  override-redirect = "false";
  cursor-click = "pointer";
  cursor-scroll = "ns-resize";
}
