{ lib, config, pkgs, ... }:

{
  options = with lib; {
    services.dnd-discord-mute = {
      enable = lib.mkEnableOption "Mute Discord when Do Not Disturb is enabled";
    };
  };

  config = lib.mkIf config.services.dnd-discord-mute.enable {
    systemd.services.dnd-discord-mute = {
      description = "Mute Discord audio when Do Not Disturb is active";
      wantedBy = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        User = "robert";
        Environment = "XDG_RUNTIME_DIR=/run/user/1000 PULSE_SERVER=unix:/run/user/1000/pulse/native DISPLAY=:0 PATH=/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:/etc/profiles/per-user/robert/bin:/home/robert/.nix-profile/bin:/nix/profile/bin:/home/robert/.local/state/nix/profile/bin";
        ExecStart = "${pkgs.writeShellScriptBin "dnd-discord-mute" ''
          #!/run/current-system/sw/bin/bash
          export XDG_RUNTIME_DIR=/run/user/1000

          get_dnd_state() {
            /run/current-system/sw/bin/dms ipc call notifications getDoNotDisturb 2>/dev/null
          }

          mute_discord() {
            for pid in $(pgrep -f "vesktop" 2>/dev/null); do
              wpctl set-mute -p "$pid" 1 2>&1
            done
          }

          unmute_discord() {
            for pid in $(pgrep -f "vesktop" 2>/dev/null); do
              wpctl set-mute -p "$pid" 0 2>&1
            done
          }

          last_state=""
          while true; do
            current_state=$(get_dnd_state)
            echo "DND: $current_state (last: $last_state)" >> /tmp/dnd-mute.log
            if [ "$current_state" != "$last_state" ]; then
              if echo "$current_state" | grep -qi "true\|enabled\|on\|1"; then
                mute_discord
              else
                unmute_discord
              fi
              last_state="$current_state"
            fi
            sleep 2
          done
        ''}/bin/dnd-discord-mute";
        Restart = "always";
      };
    };
  };
}