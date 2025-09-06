{ pkgs, lib, config, ... }:

{
  imports = [
    ../modules/sxhkd.nix
    ../modules/xwallpaper.nix
  ];

  options = {
    dwm.enable = lib.mkEnableOption "Enable dwm";
  };

  config = lib.mkIf config.dwm.enable {
    sxhkd.enable = true;
    xwallpaper.enable = true;

    home.file.".config/dwm/autostart/main.sh" = {
      text = ''
        ${pkgs.xwallpaper}/bin/xwallpaper --zoom ${config.home.homeDirectory}/.config/wallpaper/zima.jpg &
        sxhkd &
      '';
      executable=true;
    };  
  };
}
