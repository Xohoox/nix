{ pkgs, lib, config, ... }:

{
  options = {
    lightdm.enable = lib.mkEnableOption "Enable lightdm";
  };

  config = lib.mkIf config.lightdm.enable {
    environment.systemPackages = with pkgs; [
      lightlocker
      xorg.xset
      xorg.xrandr
      papirus-icon-theme
      gnome-themes-extra
    ];

    services.xserver.displayManager.sessionCommands = ''
      ${pkgs.lightlocker}/bin/light-locker --lock-after-screensaver=300 &
    '';

    services.logind.extraConfig = ''
      HandleLidSwitch=suspend
      HandleLidSwitchDocked=ignore
      IdleAction=lock
      IdleActionSec=5min
    '';

    services.xserver.displayManager.lightdm = {
      enable = true;

      greeters.gtk.enable = true;

      greeters.gtk.theme.name = "Adwaita-dark";
      greeters.gtk.iconTheme.name = "Papirus";
    };
  };
}
