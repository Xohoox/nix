{ pkgs, lib, config, ... }:

{
  options = {
    vm.enable = lib.mkEnableOption "Enable Laptop";
  };

  config = lib.mkIf config.vm.enable {
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = ["fynn"];
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;

    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
  };
}

