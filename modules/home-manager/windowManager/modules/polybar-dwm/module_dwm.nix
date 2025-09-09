{ lib, config, pkgs, colors, ... }:

{
    type = "internal/dwm";
    format = "<label-tags> <label-layout> <label-floating> <label-title>";
    format-background = "#1e1e1e";
  
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
    label-title-forefround = "#1e1e1e";
    label-title-background = "#1e1e1e";
    label-title-maxlen = 30;
  
    label-layout = "%symbol%";
    label-layout-padding = 2;
    label-layout-foreground = "#D4D4D4";
    label-layout-background = "#1e1e1e";
  
    label-focused = "%name%";
    label-focused-background = "#444";
    label-focused-underline= "#1e1e1e";
    label-focused-padding = 5;
  
    label-unfocused = "%name%";
    label-unfocused-padding = 2;
  
    label-visible = "%name%";
    label-visible-background = "#1e1e1e";
    label-visible-underline = "#1e1e1e";
    label-visible-padding = 5;
  
    label-urgent = "%name%";
    label-urgent-background = "#bd2c40";
    label-urgent-padding = 2;
  
    label-empty = "";
    label-empty-padding = 2;
  }
