{ pkgs, lib, config, ... }:

let
  dwmPackage = pkgs.stdenv.mkDerivation rec {
    pname = "dwm";
    version = "custom";

    src = pkgs.fetchFromGitHub {
      owner = "Xohoox";
      repo = "dwm";
      rev = "master";
      sha256 = "sha256-ci9T3QjzHbwZzuWsqCqDAUdtMaL7QbpPndNfu/UYpso=";
    };

    buildInputs = [
      pkgs.xorg.libX11
      pkgs.xorg.libXft
      pkgs.xorg.libXinerama
      pkgs.yajl
    ];

    installPhase = ''
      mkdir -p $out/bin
      make PREFIX=$out install
    '';
  };

  startDwmScript = pkgs.writeShellScript "start-dwm" ''
    #!/bin/sh
    find $HOME/.config/dwm/autostart -executable -exec {} ';'
    exec ${dwmPackage}/bin/dwm
  '';
in
{
  options = {
    dwm.enable = lib.mkEnableOption "Enable custom dwm build and session";
  };

  config = lib.mkIf config.dwm.enable {
    environment.systemPackages = [ dwmPackage pkgs.dmenu pkgs.sxhkd ];

    # Register dwm as a desktop session so LightDM and others can find it
    environment.etc."X11/sessions/dwm.desktop".text = ''
      [Desktop Entry]
      Name=dwm
      Comment=Dynamic window manager
      Exec=${startDwmScript}
      Type=Application
    '';

    # Ensure X11 is enabled
    services.xserver.enable = lib.mkDefault true;

    # Ensure LightDM is enabled if not already set elsewhere
    services.xserver.displayManager.lightdm.enable = lib.mkDefault true;

  };
}
