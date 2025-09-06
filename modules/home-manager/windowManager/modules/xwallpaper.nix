{ pkgs, lib, config, ... }:

{
  options = {
    xwallpaper.enable = lib.mkEnableOption "Enable xwallpaper";
  };

  config = lib.mkIf config.xwallpaper.enable {
    home.packages = [
      pkgs.xwallpaper
    ];

    home.file.".config/wallpaper/zima.jpg".source = ./resources/zima.jpg;
  };
}
