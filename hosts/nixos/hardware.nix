{ modulesPath, lib, config, pkgs, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usbhid" "uas" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "iwlwifi" "iwlmvm" ];
  boot.initrd.extraFirmwarePaths = [ "iwlwifi-so-a0-gf-a0-89.ucode.zst" ];

  boot.kernelModules = [ "kvm-intel" "iwlwifi" ];
  boot.extraModulePackages = [ ];
  boot.kernelParams = [
    "iwlwifi.power_save=0"
    "iwlwifi.disable_11ax=1"
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/2d91c01b-c195-4db9-8847-09843a76430c";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9169-398B";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}