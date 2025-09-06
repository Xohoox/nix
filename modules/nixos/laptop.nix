{ pkgs, lib, config, ... }:

{
  options = {
    laptop.enable = lib.mkEnableOption "Enable Laptop";
  };

  config = lib.mkIf config.laptop.enable {
    programs.light.enable = true;
  };
}
