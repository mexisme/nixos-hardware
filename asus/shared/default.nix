{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  imports = [
    ../battery.nix   # TODO: Move into this dir?
    ./keyboard.nix
    ./ite-device.nix
    ./iwd-mediatek.nix
  ];

  config = {
    # Configure basic system settings:
    boot = {
      kernelModules = [ "kvm-amd" ];
      kernelParams = [
        "mem_sleep_default=deep"
        "pcie_aspm.policy=powersupersave"
      ];
    };

    services = {
      asusd = {
        enable = mkDefault true;
      };

      supergfxd.enable = mkDefault true;
    };
  };
}
