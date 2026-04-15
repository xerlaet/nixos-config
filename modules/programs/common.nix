{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    socat
    grim
    slurp
    wl-clipboard
    playerctl
    brightnessctl
    hyprpicker

    firefox
    vesktop
    obsidian
    gimp
    libreoffice-fresh
    yazi
    spotify

    zoom-us
    teams-for-linux

    zathura
    imv
    mpv

    texlab
    texlive.combined.scheme-full

    vdirsyncer

    bambu-studio
  ];
}
