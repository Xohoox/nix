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

    home.activation.createNextcloudLinks = lib.hm.dag.entryAfter ["createNextcloudFolders"] ''
      ln -sf "${config.home.homeDirectory}/.local/nextcloud/Documents" "${config.home.homeDirectory}/ppr"
      ln -sf "${config.home.homeDirectory}/.local/nextcloud/Work" "${config.home.homeDirectory}/work"
      ln -sf "${config.home.homeDirectory}/.local/nextcloud/Notes" "${config.home.homeDirectory}/notes"
    '';
  };
}
