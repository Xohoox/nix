{ pkgs, lib, config, ... }:

{
  options = {
    starship.enable = lib.mkEnableOption "Enable starship as prompt";
  };

  config = lib.mkIf config.zsh.enable {
    programs.starship = {
      enable = true;

      settings = {
        add_newline = false;

        format = ''
          $cmd_duration$directory$git_state$git_branch$git_status$character
        '';

        cmd_duration = {
          min_time = 2000;
          style = "yellow";
          format = "took [$duration]($style) ";
        };

        directory = {
          style = "cyan";
        };

        git_branch = {
          symbol = " ";
          style = "purple";
        };

        git_status = {
          style = "red";
        };

        character = {
          success_symbol = "[❯](green)";
          error_symbol = "[❯](red)";
        };
      };
    };
  };
}
