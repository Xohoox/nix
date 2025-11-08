{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/nixos/windowManager/dwm.nix
      ./modules/nixos/laptop.nix
      ./modules/nixos/vm.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-eeee8245-d0e0-4093-9337-b7c143eee27b".device = "/dev/disk/by-uuid/eeee8245-d0e0-4093-9337-b7c143eee27b";
  networking.hostName = "amadeus";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  #boot.resumeDevice = "/dev/disk/by-uuid/6d06a029-82cc-420d-88f0-61cfbabb900b";

  powerManagement.enable = true;
  #services.power-profiles-daemon.enable = true;
  # Suspend first then hibernate when closing the lid
  #services.logind.lidSwitch = "suspend-then-hibernate";
  # Hibernate on power button pressed
  #services.logind.powerKey = "hibernate";
  #services.logind.powerKeyLongPress = "poweroff";

  # Suspend first
  #boot.kernelParams = ["mem_sleep_default=deep"];

  #systemd.sleep.extraConfig = ''
  #HibernateMode=platform shutdown
  #HibernateState=disk
  #'';

  # Enable networking
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  dwm.enable = true;
  laptop.enable = true;
  vm.enable  = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    users = {
      "fynn" = import ./home.nix;
    };
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
    options = "caps:escape";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  programs.zsh.enable = true;

  users.users.fynn = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Fynn";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "input" "libvirtd" ];
    packages = with pkgs; [
     brave
     alacritty
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    tree
    unzip
    nix-ld
    steam-run
    wiremix
    tldr
    dbeaver-bin
    ansible
    jdk17
    remmina
    python3Packages.pip
    python3Packages.pexpect
  ];

  services.tailscale = {
    enable = true;
    extraUpFlags = [ "--accept-routes" ];
  };

  services.postgresql = {
    enable = true;
  };

  programs.nix-ld.enable = true;

   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  programs.firefox.enable = true;

  services.openssh.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.dbus.enable = true;

  programs.dconf.enable = true;

  system.stateVersion = "25.05";
}
