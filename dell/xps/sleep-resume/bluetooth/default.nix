{config, pkgs, lib, ...}:

let
  cfg = config.services.sleep-resume.bluetooth;
in

with lib;

{
  options = {
    services.sleep-resume.bluetooth = {
      enable = mkOption {
        default = false;
        type = with types; bool;
        description = ''
           Reload Bluetooth after resuming from sleep.
         '';
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.sleep-resume_bluetooth = {
      wantedBy = [ "suspend.target" ];
      after = [ "suspend.target" ];
      description = "Reload Bluetooth after resuming from sleep.";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = [
          "${pkgs.systemd}/bin/systemctl stop bluetooth"
          "${pkgs.kmod}/bin/modprobe -r btusb"
          "${pkgs.coreutils}/bin/sleep 5"
          "${pkgs.kmod}/bin/modprobe btusb"
        ];
      };
    };

    environment.systemPackages = [ pkgs.kmod pkgs.coreutils ];
  };
}



