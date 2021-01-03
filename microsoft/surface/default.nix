{ config, lib, pkgs, ... }:
{
  imports = [
    ./kernel
    ./firmware
    # ./hardware_configuration.nix
  ];

  # boot.kernelPackages = surface_kernelPackages.linux_5_10_2;
  # boot.kernelPatches = surface_kernelPatches.linux_???;
}
