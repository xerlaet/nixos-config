{ lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware.nix
    ./greetd.nix

    ../../profiles/gaming-laptop/default.nix
    ../../modules/desktop/sudoers.nix
    ../../modules/services/audio.nix
    ../../modules/services/bluetooth.nix
    ../../modules/services/wifi.nix
    ../../modules/services/printing.nix
    ../../modules/services/dnd-discord-mute.nix
    ../../modules/users/robert.nix
  ];

  programs.dms-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableClipboardPaste = true;
    plugins = {
      dankPomodoroTimer.enable = true;
      dankBatteryAlerts.enable = true;
    };
  };

  services.upower.enable = true;
  services.udisks2.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.usePredictableInterfaceNames = lib.mkDefault false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;
  hardware.enableRedistributableFirmware = true;

  boot.loader.systemd-boot = {
    enable = true;
    extraEntries = {
      "windows.conf" = "title Windows\nchain /EFI/Microsoft/Boot/bootmgfw.efi";
    };
  };

  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  services.xserver.dpi = 96;

  fonts.fontconfig.enable = true;
  fonts.fontDir.enable = true;
  fonts.fontconfig.defaultFonts = {
    monospace = [ "FiraCode Nerd Font Mono" ];
  };
  fonts.packages = with pkgs; [
    cantarell-fonts
    noto-fonts
    nerd-fonts.fira-code
  ];

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    pciutils
    lshw
    dmidecode
    go
    thunar
    gvfs
    thunar-volman
    udiskie
    usbutils
    ethtool
  ];

  system.stateVersion = "25.11";
}
