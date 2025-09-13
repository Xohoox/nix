{ lib, config, pkgs, colors, ... }:

{
  type = "internal/network";
  interface = "wlp192s0";
  interval = 3.0;
  
  format-connected = "<ramp-signal>   <label-connected>";
  label-connected = "%essid%";
  
  format-disconnected = "";
  
  ramp-signal-0 = "󰤯";
  ramp-signal-1 = "󰤟";
  ramp-signal-2 = "󰤢";
  ramp-signal-3 = "󰤥";
  ramp-signal-4 = "󰤨";
}
