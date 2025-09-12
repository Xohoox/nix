{ pkgs, lib, config, ... }:

let
  polybarSettings = import ./settings.nix { lib = lib; config = config; pkgs = pkgs; };

  polybar-dwm = pkgs.stdenv.mkDerivation {
    pname = "polybar-dwm";
    version = "3.7.1";
    src = pkgs.fetchFromGitHub {
      owner = "mihirlad55";
      repo = "polybar-dwm-module";
      rev = "09eac084494d90310a5a27a01b32dc515f6db352";
      sha256 = "sha256-CeJ47CqzO2KZ+QyebxJtramJfVHfdsVgREcFAE7zdeo=";
      fetchSubmodules = true;
    };

    nativeBuildInputs = [ pkgs.cmake pkgs.pkg-config ];
    buildInputs = [
      pkgs.cmake
      pkgs.pkg-config
      pkgs.jsoncpp
      pkgs.cairo
      pkgs.xorg.libxcb
      pkgs.xorg.xcbutil
      pkgs.xorg.xcbutilwm
      pkgs.xcbutilxrm
      pkgs.xorg.xcbutilimage
      pkgs.xorg.xcbutilcursor
      pkgs.libpulseaudio
      pkgs.alsa-lib
      pkgs.freetype
      pkgs.fontconfig
      pkgs.libuv
      pkgs.xcb-proto
      pkgs.python3
    ];
      #pkgs.dwm    # optional, if you want to link against patched dwm

    cmakeFlags = [
      "-DENABLE_DWM=ON"
      "-DBUILD_DOC=OFF"
    ];
    enableParallelBuilding = true;

    installPhase = ''
      mkdir -p $out/bin
      cp bin/polybar $out/bin/
    '';
  };

  polybarRunScript = pkgs.writeShellScriptBin "polybarRun" ''
    #!/bin/sh
    pkill -x polybar

    if type "xrandr"; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload > /dev/null &
      done
    else
      polybar -q --reload > /dev/null &
    fi
  '';
in
{
  options = {
    polybar-dwm.enable = lib.mkEnableOption "Enable polybar-dwm";
  };

  config = lib.mkIf config.polybar-dwm.enable {
    services.polybar = {
      enable = true;
      package = polybar-dwm;
      script = "polybarRun &";
      settings = polybarSettings;
    };

    home.packages = [ polybarRunScript ];
  };  
}
