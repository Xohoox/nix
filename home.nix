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
    ./modules/home-manager/applications/uni.nix
    ./modules/home-manager/applications/discord.nix
  ];
  home.username = "fynn";
  home.homeDirectory = "/home/fynn";

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  xdg.enable = true;
  dwm.enable = true;
  alacritty.enable = true;
  git.enable = true;
  fonts.enable = true;
  zsh.enable = true;
  neovim.enable = true;
  nextcloud.enable = true;
  uni.enable = true;
  discord.enable = true;

  gtk = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
