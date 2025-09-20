{ pkgs, lib, config, ... }:

{
  options = {
    neovim.enable = lib.mkEnableOption "Enable neovim";
  };

  config = lib.mkIf config.neovim.enable {
    programs.neovim.enable = true;

    home.activation.cloneNvimConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -d "$HOME/.config/nvim" ]; then
        echo "Cloning Neovim config..."
        ${pkgs.git}/bin/git clone https://github.com/Xohoox/neovim-config.git "$HOME/.config/nvim"
      else
        echo "Neovim config already exists, skipping clone."
      fi
    '';

    systemd.user.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

   home.packages = with pkgs; [ gcc nodejs_24 ripgrep ];
  };
}
