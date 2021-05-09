{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.callPackage ./linux-5.11.18 {};
}
