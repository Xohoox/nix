{ pkgs, lib, config, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "Enable git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "Fynn Michell-Auli";
      userEmail = "f.michell-auli@live.de";
      extraConfig = {
        init = { 
          defaultBranch = "main"; 
        };
      };
    };
  };
}
