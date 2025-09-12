{ lib, config, pkgs, colors, ... }:

{
    type = "internal/dwm";
    format = "<label-tags> <label-layout> <label-floating> <label-title>";
    format-background = "${colors.bg}";
  
    enable-tags-click = true;
    enable-tags-scroll = true;
    tags-scroll-empty = false;
    tags-scroll-reverse = false;
    tags-scroll-wrap = false;
    enable-layout-click = false;
    enable-layout-scroll = false;
    layout-scroll-wrap = false;
    layout-scroll-reverse = false;
  
    secondary-layout-symbol = "[M]";
  
    label-title = "%title%";
    label-title-padding = 2;
    label-title-forefround = "${colors.bg}";
    label-title-background = "${colors.bg}";
    label-title-maxlen = 30;
  
    label-layout = "%symbol%";
    label-layout-padding = 2;
    label-layout-foreground = "${colors.fg}";
    label-layout-background = "${colors.bg}";
  
    label-focused = "%name%";
    label-focused-background = "${colors.bg-alt}";
    label-focused-underline= "${colors.bg}";
    label-focused-padding = 5;
  
    label-unfocused = "%name%";
    label-unfocused-padding = 2;
  
    label-visible = "%name%";
    label-visible-background = "${colors.bg}";
    label-visible-underline = "${colors.bg}";
    label-visible-padding = 5;
  
    label-urgent = "%name%";
    label-urgent-background = "${colors.alert}";
    label-urgent-padding = 2;
  
    label-empty = "";
    label-empty-padding = 2;
  }
