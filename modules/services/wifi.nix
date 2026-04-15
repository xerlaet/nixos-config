{ pkgs, ... }:
{
  systemd.services.rfkill-unblock-wifi = {
    description = "Unblock WiFi rfkill";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.util-linux}/bin/rfkill unblock wifi";
    };
  };
}