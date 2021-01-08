{ lib, pkgs, fetchgit }:
{
  linux-surface = fetchgit {
    url="https://github.com/linux-surface/linux-surface.git";
    rev="25ab2cf75e5eda5ab9739db1907300010c06dacf";
    sha256="0h8624d7ix1p6ysw9bllmnnwnv164z8xkx56zj3vdczn91vmqcf9";
  };

  linux-kernel-firmware = fetchgit {
    url="https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
    rev="060ad8b3d505e2ff8878d11a81da3532b983cd45";
    sha256="0n93xc3vzx7gy96lpkypw7ay201x7whirxm00c0zhq6zmq2zs12v";
  };

  surface-ath10k-firmware = fetchgit {
    url="https://github.com/kvalo/ath10k-firmware";
    rev="84b47062aab31d67156e0a3ef593a6999a12864b";
    sha256="0l8wfj8z4jbb31nzqkaxisby0n6061ix01c5di9bq66iby59j8py";
  };

  surface-ipts-firmware = fetchgit {
    url="https://github.com/linux-surface/surface-ipts-firmware.git";
    rev="bd5093318d2550d5d668241d0d34df4be3fc03ab";
    sha256="0q7k52yk3jdliizl3cq1m3zbbqsx360wxybnbgkaq46rawzhw5bk";
  };

  libwacom-surface = fetchgit {
    url="https://github.com/linux-surface/libwacom-surface.git";
    rev="12628e069298ac2e409501d423a1bf8567b5d1bb";
    sha256="1lydyfx33crd0qvzdyqyp39d0d9fnsplch6429sagdsn6a139ap0";
  };
}
