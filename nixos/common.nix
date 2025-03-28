{ config, pkgs, ... }:
{
  networking.hostName = "skynet";
  time.timeZone = "Europe/Vienna";
  i18n.defaultLocale = "de_AT.UTF-8";
  nixpkgs.config.allowUnfree = true;

  # Filesystem and GRUB
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };

  swapDevices = [
    { device = "/dev/sda2"; }
  ];

  boot.resumeDevice = "/dev/sda2";

  boot.loader.grub = {
    enable = true;
    devices = [ "/dev/sda" ];
    useOSProber = false;
  };

  boot.loader.timeout = 1;

  # Enable services
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = false;
  services.xserver.displayManager.defaultSession = "hyprland";
  programs.hyprland.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Docker
  virtualisation.docker.enable = true;

  # Users
  users.users.flo = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "kvm"
      "libvirt"
    ];
    hashedPassword = "$6$AMpY0OsUEn9S/79z$yu2uRCIJqXchbRTKStvwpDVj5FMo66fBIhPRi9hiQvvydd8o9sPUJ7YPnAI/jUiJ0LHMoGwR8ufsWBI.I55TJ/";
  };

  environment.systemPackages = with pkgs; [
    docker

    meslo-lgs-nf

    nettools
    zip
    gnutar
    curl
    wget

    firefox
  ];

  # Nix settings
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "24.11";
}
