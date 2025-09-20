{ pkgs, lib, config, ... }:

{
  imports = [
    ./comic-code.nix
  ];

  options = {
    fonts.enable = lib.mkEnableOption "Enable custom fonts";
  };

  config = lib.mkIf config.fonts.enable {
    comic-code.enable = true;

    home.packages = [ pkgs.font-awesome ];
  };
}
