{ pkgs, lib, config, ... }:

{
  options = {
    nextcloud.enable = lib.mkEnableOption "Enable nextcloud";
  };

  config = lib.mkIf config.nextcloud.enable {
    services.nextcloud-client.enable = true;
    services.nextcloud-client.startInBackground = true;

    home.activation.createNextcloudFolder = lib.hm.dag.entryAfter ["writeBoundary"] ''
      mkdir -p "${config.home.homeDirectory}/.local/nextcloud"
    '';

    home.file."ppr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/nextcloud/Documents";
    home.file."work".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/nextcloud/Work";
    home.file."notes".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/nextcloud/Notes";
  };
}
