{
  config,
  lib,
  ...
}:

let
  inherit (lib)
    mkEnableOption
    mkIf
    ;

  cfg = config.hardware.asus;
in
{
  # The ASUS 8295 ITE device will cause an immediate wake-up when trying to suspend the laptop.
  # After the first successful hibernate, it will work as expected, however.
  # NOTE: I'm not actually sure what this device, as neither the touchpad nor the M1-M4 keys cause a wake-up.
  options.hardware.asus.ite-device.wakeup.enable =
    mkEnableOption "Enable power wakeup on the ASUS internal USB keyboard-like device (8295 ITE Device)";

  config = (mkIf (!cfg.ite-device.wakeup.enable) {
    services.udev.extraRules = ''
      # Disable power wakeup for the 8295 ITE device.
      # Otherwise on certain kernel-versions, it will tend to cause the laptop to immediately wake-up when suspending.
      # ACTION=="add|change", SUBSYSTEM=="usb", DRIVER="usb", TEST="power/wakeup", ATTR{idVendor}=="0b05", ATTR{idProduct}=="193b", ATTR{power/wakeup}="disabled"
      ACTION=="add|change", SUBSYSTEM=="usb", ATTR{idVendor}=="0b05", ATTR{idProduct}=="193b", ATTR{power/wakeup}="disabled"
    '';
  });
}
