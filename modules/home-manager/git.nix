{ pkgs, lib, config, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "Enable git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;

      settings = {
        user = {
          name = "Fynn Michell-Auli";
          email = "f.michell-auli@live.de";
        };
          init.defaultBranch = "main"; 
      };
    };
  };
}
