{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    vdirsyncer
    khal
  ];

  home.file = {
    ".vdirsyncer/config".text = ''
      [general]
      status_path = "~/.calendars/status"

      [pair personal_sync]
      a = "personal"
      b = "personallocal"
      collections = ["from a", "from b"]
      conflict_resolution = "a wins"
      metadata = ["color"]

      [storage personal]
      type = "google_calendar"
      token_file = "~/.vdirsyncer/google_calendar_token"
      client_id = "REDACTED"
      client_secret = "REDACTED"

      [storage personallocal]
      type = "filesystem"
      path = "~/.calendars/Personal"
      fileext = ".ics"
    '';

    ".config/khal/khal.conf".text = ''
      [calendars]
      [[personal]]
      path = /home/robert/.calendars/Personal/REDACTED/
      color = dark blue

      [locale]
      local_timezone = America/Chicago
      default_timezone = America/Chicago
      timeformat = %H:%M
      dateformat = %Y-%m-%d
      longdateformat = %Y-%m-%d
      datetimeformat = %Y-%m-%d %H:%M
      longdatetimeformat = %Y-%m-%d %H:%M

      [default]
      default_calendar = personal

      [view]
      agenda_day_format = "{name}, {date-long}"
    '';
  };

  xdg.configFile = {
    "systemd/user/vdirsyncer-sync.service".text = ''
      [Unit]
      Description=Sync calendars with vdirsyncer

      [Service]
      Type=oneshot
      ExecStart=${pkgs.vdirsyncer}/bin/vdirsyncer sync
    '';

    "systemd/user/vdirsyncer-sync.timer".text = ''
      [Unit]
      Description=Periodic calendar sync with vdirsyncer

      [Timer]
      OnBootSec=5min
      OnUnitActiveSec=15min
      Persistent=true

      [Install]
      WantedBy=timers.target
    '';
  };
}
