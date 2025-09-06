{ pkgs, lib, config, ... }:

{
  options = {
    sxhkd.enable = lib.mkEnableOption "Enable sxhkd";
  };

  config = lib.mkIf config.sxhkd.enable {
    services.sxhkd.enable = true;
    services.sxhkd.keybindings = {
      "super + Return" = "alacritty";
      "super + c" = "brave";
      "{XF86MonBrightnessUp, XF86MonBrightnessDown}" = "light {-A 20,-U 20}";
      "{XF86AudioRaiseVolume, XF86AudioLowerVolume}" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ {0.05+,0.05-}";
      "XF86AudioMute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    };
  };
}
