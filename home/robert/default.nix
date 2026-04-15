{ config, pkgs, inputs, ... }:

{
  imports = [
    ./gtk.nix
    ./imports.nix
    ./matugen.nix
  ];

  home.username = "robert";
  home.homeDirectory = "/home/robert";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
  
  fonts.fontconfig.antialiasing = true;
  fonts.fontconfig.hinting = "slight";

  xdg.userDirs = {
    enable = true;
    desktop = "$HOME/";
    documents = "$HOME/documents";
    download = "$HOME/downloads";
    music = "$HOME/music";
    pictures = "$HOME/pictures";
    publicShare = "$HOME/public";
    templates = "$HOME/templates";
    videos = "$HOME/videos";
    createDirectories = false;
    setSessionVariables = true;
  };

  xdg.configFile = {
    "hypr/scripts/monitor-handler.sh" = {
      executable = true;
      text = ''
        #!/bin/bash
        # Monitor handler for Hyprland - handles hot-plug events

        logger "monitor-handler: started"

        handle() {
          case "$1" in
            monitoraddedv2*)
              monitor_name=$(echo "$1" | cut -d'>>' -f2)
              logger "monitor-handler: Monitor added: $monitor_name"

              # Skip laptop display
              if [[ "$monitor_name" == eDP-* ]]; then
                logger "monitor-handler: Skipping laptop display"
                return
              fi

              # Apply settings to external monitor
              hyprctl monitor "$monitor_name,3440x1440@144,0x0,1,bitdepth,10"
              logger "monitor-handler: Configured $monitor_name as 3440x1440@144"
              ;;

            monitorremoved*)
              monitor_name=$(echo "$1" | cut -d'>>' -f2)
              logger "monitor-handler: Monitor removed: $monitor_name"
              ;;
          esac
        }

        # Subscribe to socket2 and process events
        socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | \
          while read -r line; do
            handle "$line"
          done
      '';
    };

    "autostart/udiskie.desktop" = {
      text = ''
        [Desktop Entry]
        Type=Application
        Name=Udiskie
        Exec=${pkgs.udiskie}/bin/udiskie -t
        Hidden=true
        NoDisplay=true
      '';
    };

    "yazi/yazi.toml" = {
      text = ''
        [opener]
        pdf = [{ run = "zathura %s" }]
        image = [{ run = "imv %s" }]
        video = [{ run = "mpv %s" }]

        [open]
        rules = [
          { url = "*.pdf", use = "pdf" },
          { url = "*.jpg", use = "image" },
          { url = "*.jpeg", use = "image" },
          { url = "*.png", use = "image" },
          { url = "*.gif", use = "image" },
          { url = "*.webp", use = "image" },
          { url = "*.bmp", use = "image" },
          { url = "*.svg", use = "image" },
          { url = "*.mp4", use = "video" },
          { url = "*.mkv", use = "video" },
          { url = "*.avi", use = "video" },
          { url = "*.mov", use = "video" },
          { url = "*.webm", use = "video" },
          { url = "*.mp3", use = "video" },
          { url = "*.wav", use = "video" },
          { url = "*.flac", use = "video" }
        ]
      '';
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
