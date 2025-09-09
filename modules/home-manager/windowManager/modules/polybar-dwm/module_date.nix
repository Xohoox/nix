{ lib, config, pkgs, colors, ... }:

{
  type = "internal/date";
  interval = 1;
  
  time = "  %H:%M ";
  date = "  %a %d.%m";
  
  format-prefix-foreground = "${colors.fg-alt}";
  
  label = "%time% %date%";
}
