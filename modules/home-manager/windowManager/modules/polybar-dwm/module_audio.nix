{ lib, config, pkgs, colors, ... }:

{
  type = "internal/pulseaudio";
  
  format-volume = "<ramp-volume> <label-volume>";
  label-volume = "%percentage%%";
  
  ramp-volume-0 = "󰕿";
  ramp-volume-1 = "󰖀";
  ramp-volume-2 = "󰕾";
  
  label-muted = "󰖁";
  label-muted-foreground = "${colors.fg}";
}
