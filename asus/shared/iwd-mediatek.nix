{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkIf ;

in
{
  config =
    (mkIf (config.networking.wireless.iwd.enable && config.networking.wireless.scanOnLowSignal) {
      # Meditek doesn't seem to be quite sensitive enough on the default roaming settings:
      #   https://wiki.archlinux.org/title/Wpa_supplicant#Roaming
      #   https://wiki.archlinux.org/title/Iwd#iwd_keeps_roaming
      #
      # But NixOS doesn't have the tweaks for IWD, yet.
      networking.wireless.iwd.settings = {
        General = {
          RoamThreshold = -75;
          RoamThreshold5G = -80;
          RoamRetryInterval = 20;
        };
      };
    });
}
