{ pkgs, lib, config, ... }:

{
  imports = [
    ./obsidian.nix
  ];

  options = {
    uni.enable = lib.mkEnableOption "Enable uni";
  };

  config = lib.mkIf config.uni.enable {
    obsidian.enable = true;

    home.packages = with pkgs; [ zoom go ];
  };
}
