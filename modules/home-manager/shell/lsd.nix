{ pkgs, lib, config, ... }:

{
  options = {
    lsd.enable = lib.mkEnableOption "Enable lsd";
  };

  config = lib.mkIf config.zsh.enable {
    programs.lsd = {
      enable = true;

      icons = {
        when = "auto";
        theme = "fancy";
      };

      icons = {
        name = {
          img = "";
          dwn = "";
          aud = "";
          vid = "";
          rep = "";
        };
      };

      settings = {
        date = "+  %d.%m.%Y   %H:%M:%S";

        ignore-globs = [
          ".steam"
          ".steampath"
          ".steampid"
          ".vscode-oss"
          ".pulse-cookie"
          ".cmake"
          ".pki"
          ".zshenv"
          ".xsession"
          ".xprofile"
          ".Xauthority"
          ".nix-profile"
        ];

        size = "short";
      };

      colors = {
        user = "yellow";
        group = "yellow";

        permission = {
          read        = "magenta";
          write       = "dark_yellow";
          exec        = "dark_red";
          exec-sticky = "dark_magenta";
          no-access   = "dark_grey";
          octal       = "dark_cyan";
          acl         = "dark_cyan";
          context     = "cyan";
        };

        date = {
          hour-old = "cyan";
          day-old  = "green";
          older    = "dark_green";
        };

        size = {
          none   = "dark_grey";
          small  = "yellow";
          medium = "yellow";
          large  = "dark_yellow";
        };

        inode = {
          valid   = "magenta";
          invalid = "grey";
        };

        links = {
          valid   = "magenta";
          invalid = "grey";
        };

        tree-edge = "dark_grey";
      };
    };
  };
}
