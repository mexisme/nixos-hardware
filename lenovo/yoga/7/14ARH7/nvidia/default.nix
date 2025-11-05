# Including this file will enable the NVidia driver, and PRIME offload

{ lib,
  pkgs,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  imports = [
    ../shared.nix
    ## "prime.nix" loads this, aleady:
    # ../../../../common/gpu/nvidia
    ../../../../../common/gpu/nvidia/prime.nix
    ../../../../../common/gpu/nvidia/ampere
  ];

  # NVIDIA GeForce RTX 3050 Mobile (Ampere)
 
  boot = {
    blacklistedKernelModules = [ "nouveau" ];
  };

  # Also in nvidia/default.nix
  services.xserver.videoDrivers = mkDefault [ "nvidia" ];

  hardware = {
    ## Enable the Nvidia card, as well as Prime and Offload:
    amdgpu.initrd.enable = mkDefault true;

    nvidia = {
      modesetting.enable = mkDefault true;
      nvidiaSettings = mkDefault true;

      prime = {
        offload = {
          enable = mkDefault true;
          enableOffloadCmd = mkDefault true;
        };
        amdgpuBusId = "PCI:4:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };

      powerManagement = {
        enable = true;
        # Doesn't seem to be reliable, yet?
        # finegrained = true
      };
    };
  };
}
