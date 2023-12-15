{ config, lib, pkgs, ... }:
{
  systemd.timers."backup-nix" = {
  wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "Mon,Tue *-*-01..04 12:00:00";
      Unit = "backup-nix.service";
    };
  };

  systemd.services."backup-nix" = {
    script = ''
      set -eu
      /home/faaiq/backup.sh
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
