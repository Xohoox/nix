{ pkgs, lib, config, ... }:

let
  alias = import ./alias.nix { lib = lib; config = config; pkgs = pkgs; };
  abbr = import ./abbr.nix { lib = lib; config = config; pkgs = pkgs; };
in
{
  options = {
    zsh.enable = lib.mkEnableOption "Enable zsh as shell";
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      dotDir = ".config/zsh";

      initContent = ''
        setopt interactive_comments
        setopt interactive_comments
        unsetopt BEEP
        stty stop undef
      '';

      history = {
        append = true;
        size = 1000000;
        save = 1000000;
        path = "${config.xdg.dataHome}/zsh/zsh_history";
        saveNoDups = true;
        ignoreAllDups = true;
      };

      shellAliases = alias;

      zsh-abbr = {
        enable = true;
        abbreviations = abbr;
      };
    };

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "zsh-abbr"
    ];

    programs.fzf.enable = true;
    programs.fzf.enableZshIntegration = true;

    programs.starship = {
      enable = true;
      enableZshIntegration = true;

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
