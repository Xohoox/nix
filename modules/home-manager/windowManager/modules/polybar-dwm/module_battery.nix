{ lib, config, pkgs, colors, ... }:

{
  type = "internal/battery";
  battery = "BAT1";
  adapter = "ACAD";
  full-at = 98;
  
  format-charging = "<animation-charging> <label-charging>";
  
  format-discharging = "<animation-discharging> <label-discharging>";
  
  format-full-prefix = "󰁹 ";
  
  ramp-capacity-0 = "󰁺";
  ramp-capacity-1 = "󰁻";
  ramp-capacity-2 = "󰁼";
  ramp-capacity-3 = "󰁼";
  ramp-capacity-4 = "󰁼";
  ramp-capacity-5 = "󰁾";
  ramp-capacity-6 = "󰁿";
  ramp-capacity-7 = "󰂀";
  ramp-capacity-8 = "󰁼";
  ramp-capacity-9 = "󰂂";
  
  ramp-discharging-0 = "󰁹";
  ramp-discharging-1 = "󰂂";
  ramp-discharging-2 = "󰂀";
  ramp-discharging-3 = "󰁿";
  ramp-discharging-4 = "󰁾";
  ramp-discharging-5 = "󰁼";
  ramp-discharging-6 = "󰁼";
  ramp-discharging-7 = "󰁼";
  ramp-discharging-8 = "󰁻";
  ramp-discharging-9 = "󰁺";
  
  animation-charging-0 = "󰢜";
  animation-charging-1 = "󰂆";
  animation-charging-2 = "󰂇";
  animation-charging-3 = "󰂇";
  animation-charging-4 = "󰂈";
  animation-charging-5 = "󰢝";
  animation-charging-6 = "󰂉";
  animation-charging-7 = "󰢞";
  animation-charging-8 = "󰂊";
  animation-charging-9 = "󰂋";
  animation-charging-10 = "󰂅";
  animation-charging-framerate = 750;
  
  animation-discharging-0 = "󰁹";
  animation-discharging-1 = "󰂂";
  animation-discharging-2 = "󰂀";
  animation-discharging-3 = "󰁿";
  animation-discharging-4 = "󰁾";
  animation-discharging-5 = "󰁼";
  animation-discharging-6 = "󰁼";
  animation-discharging-7 = "󰁼";
  animation-discharging-8 = "󰁻";
  animation-discharging-9 = "󰁺";
  animation-discharging-framerate = 750;
}
