{ lib, inputs, config, pkgs, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-legion-16irx8h
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.grub.enable = lib.mkForce false;
  };
}
