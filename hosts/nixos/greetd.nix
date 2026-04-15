{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;

  security.polkit.enable = true;

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "hyprland";
    configHome = "/home/robert";
  };
}
