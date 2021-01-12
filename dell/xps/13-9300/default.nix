{ lib, pkgs, ... }:

{
  imports = [
    ../../../common/cpu/intel
    ../../../common/pc/laptop
    ../../../common/pc/laptop/acpi_call.nix
    ../sleep-resume/i2c_designware
    ../sleep-resume/bluetooth
  ];

  # Force S3 sleep mode. See README.wiki for details.
  boot.kernelParams = [ "mem_sleep_default=deep" ];

  # touchpad goes over i2c
  boot.blacklistedKernelModules = [ "psmouse" ];

  # This will save you money and possibly your life!
  services.thermald.enable = true;

  services.sleep-resume.bluetooth.enable = true;
  services.sleep-resume.i2c_designware.enable = true;
}
