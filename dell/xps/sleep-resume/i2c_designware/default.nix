{config, pkgs, lib, ...}:

let
  cfg = config.services.sleep-resume.i2c_designware;
in

with lib;

{
  options = {
    services.sleep-resume.i2c_designware = {
      enable = mkOption {
        default = false;
        type = with types; bool;
        description = ''
           Reload the i2c_designware driver after resuming from sleep.
         '';
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.sleep-resume_i2c_designware = {
      wantedBy = [ "suspend.target" ]; 
      after = [ "suspend.target" ];
      description = "Reload the i2c_designware driver after resuming from sleep.";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = [
          "${pkgs.kmod}/bin/modprobe -r i2c_designware_platform"
          "${pkgs.kmod}/bin/modprobe -r i2c_designware_core"
          # NOTE: In kernel 5.12, you may also need to add the i2c_hid_acpi driver, as it was split-off in this release:
          # "${pkgs.kmod}/bin/modprobe i2c_hid_acpi"
          "${pkgs.kmod}/bin/modprobe -r i2c_hid"

          "${pkgs.coreutils}/bin/sleep 0.1"
          "${pkgs.kmod}/bin/modprobe i2c_designware_platform"

          # psmouse driver seems to get auto-loaded:
          # "${pkgs.kmod}/bin/modprobe -r psmouse"
        ];
      };
    };

    environment.systemPackages = [ pkgs.kmod pkgs.coreutils ];
  };
}



