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
in
{
  options = {
    dwm.enable = lib.mkEnableOption "Enable custom dwm build and session";
  };

  config = lib.mkIf config.dwm.enable {
    environment.systemPackages = [ pkgs.dmenu pkgs.sxhkd pkgs.xclip ];

    services.xserver.windowManager.dwm.package = dwmPackage;
    services.xserver.windowManager.dwm.enable = true;
  };
}
