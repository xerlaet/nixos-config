{ pkgs, ... }:

{
  users.users.robert = {
    isNormalUser = true;
    description = "Robert Teal";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" ];
  };

  environment.systemPackages = with pkgs; [
    opencode
    pulseaudio
    upower
    adwaita-icon-theme
    thunderbird
  ];
}
