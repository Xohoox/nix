{ pkgs, lib, config, ... }:

{
  options = {
    comic-code.enable = lib.mkEnableOption "Enable comic-code";
  };

  config = lib.mkIf config.comic-code.enable {
    home.file.".local/share/fonts".source = ./resources/comicCode;
    home.file.".local/share/fonts".recursive = true;
  };
}
