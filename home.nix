{ config, pkgs, ... }:

{
  imports = [
    ./modules/home-manager/windowManager/dwm/dwm.nix
    ./modules/home-manager/alacritty.nix
    ./modules/home-manager/git.nix
    ./modules/home-manager/fonts/fonts.nix
    ./modules/home-manager/shell/zsh.nix
    ./modules/home-manager/editors/neovim.nix
    ./modules/home-manager/applications/nextcloud.nix
  ];
  home.username = "fynn";
  home.homeDirectory = "/home/fynn";

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  xdg.enable = true;
  dwm.enable = true;
  alacritty.enable = true;
  git.enable = true;
  fonts.enable = true;
  zsh.enable = true;
  neovim.enable = true;
  nextcloud.enable = true;
}
