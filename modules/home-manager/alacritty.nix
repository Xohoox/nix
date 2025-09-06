{ pkgs, lib, config, ... }:

{
  options = {
    alacritty.enable = lib.mkEnableOption "Enable alacritty";
  };

  config = lib.mkIf config.alacritty.enable {
    programs.alacritty.enable = true;
    programs.alacritty.theme = "dark_plus";
    #environment.variables.TERMINAL = "alacritty";
    systemd.user.sessionVariables.TERMINAL = "alacritty";
  };
}
