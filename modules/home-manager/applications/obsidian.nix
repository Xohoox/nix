{ pkgs, lib, config, ... }:

{
  options = {
    obsidian.enable = lib.mkEnableOption "Enable obsidian";
  };

  config = lib.mkIf config.obsidian.enable {
    programs.obsidian = {
      enable = true;

      # vaults = {
      #   notes = {
      #     enable = true;
      #     target = "${config.home.homeDirectory}/notes";
      #   };
      # };
    };
  };
}
