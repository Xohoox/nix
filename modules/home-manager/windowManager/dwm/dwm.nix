{ pkgs, lib, config, ... }:

{
  imports = [
    ../modules/sxhkd.nix
    ../modules/xwallpaper.nix
    ../modules/polybar-dwm/polybar-dwm.nix
  ];

  options = {
    dwm.enable = lib.mkEnableOption "Enable dwm";
  };

  config = lib.mkIf config.dwm.enable {
    sxhkd.enable = true;
    xwallpaper.enable = true;
    polybar-dwm.enable = true;

    xsession = {
      enable = true;
      windowManager.command = "dwm";
      initExtra = ''
        ${pkgs.xwallpaper}/bin/xwallpaper --zoom ${config.home.homeDirectory}/.config/wallpaper/zima.jpg &
        sxhkd &
        polybarRun &
        themr screenProfile select desk &
      '';
    };
  };
}
