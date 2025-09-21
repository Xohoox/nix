{ pkgs, lib, config, ... }:

let
  alias = import ./alias.nix { lib = lib; config = config; pkgs = pkgs; };
  abbr = import ./abbr.nix { lib = lib; config = config; pkgs = pkgs; };
in
{
  imports = [
    ./lsd.nix
    ./starship.nix
  ];

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
        zvm_after_init_commands+=('eval "$(${pkgs.fzf}/bin/fzf --zsh)"')
      '';

        #zvm_after_init_commands+=('source ${pkgs.zsh-abbr}/share/zsh/zsh-abbr/zsh-abbr.plugin.zsh')

      history = {
        append = true;
        size = 1000000;
        save = 1000000;
        path = "${config.xdg.dataHome}/zsh/zsh_history";
        saveNoDups = true;
        ignoreAllDups = true;
      };

      shellAliases = alias // abbr;

      #zsh-abbr = {
      #  enable = false;
      #  abbreviations = abbr;
      #};

      plugins = [
        {
          name = "vi-mode";
          src = pkgs.zsh-vi-mode;
          file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        }
      ];
    };

    programs.fzf.enable = true;
    programs.fzf.enableZshIntegration = false;

    lsd.enable = true;
    programs.lsd.enableZshIntegration = true;

    starship.enable = true;
    programs.starship.enableZshIntegration = true;
  };
}
