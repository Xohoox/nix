{ pkgs, lib, config, ... }:

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

      history = {
        append = true;
        size = 1000000;
        save = 1000000;
        path = "${config.xdg.dataHome}/zsh/zsh_history";
        saveNoDups = true;
      };
    };
  };
}
