{
  config,
  lib,
  ...
}:

let
  inherit (lib)
    mkEnableOption
    mkIf
    mkMerge
    versionAtLeast
    ;

  cfg = config.hardware.asus;
in
{
  # Kernels earlier than 6.9 (possibly even earlier) tend to take 1-2 key-presses
  # to wake-up the internal keyboard after the device is suspended.
  # Therefore, this option disables auto-suspend for the keyboard by default, but
  # enables it for kernel 6.9.x onwards.
  #
  # Note: the device name is "ASUS N-KEY Device".
  options.hardware.asus.keyboard.n-key.autosuspend.enable =
    (mkEnableOption "Enable auto-suspend on the ASUS internal USB Keyboard (ASUS N-KEY Device.")
    // {
      default = versionAtLeast config.boot.kernelPackages.kernel.version "6.9";
      defaultText = lib.literalExpression "lib.versionAtLeast config.boot.kernelPackages.kernel.version \"6.9\"";
    };

  config = mkMerge [
    {
      services.udev.extraHwdb = ''
        # Fixes mic mute button
        evdev:name:*:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
        KEYBOARD_KEY_ff31007c=f20
      '';
    }

    (mkIf (!cfg.keyboard.autosuspend.enable) {
      services.udev.extraRules = ''
        # Disable power auto-suspend for the ASUS N-KEY device, i.e. USB Keyboard.
        # Otherwise on certain kernel-versions, it will tend to take 1-2 key-presses to wake-up after the device suspends.
        ACTION=="add", SUBSYSTEM=="usb", TEST=="power/autosuspend", ATTR{idVendor}=="0b05", ATTR{idProduct}=="19b6", ATTR{power/autosuspend}="-1"
      '';
    })
  ];
}
