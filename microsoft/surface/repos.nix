{ lib, pkgs, fetchgit, fetchurl }:
{
  linux-surface = fetchgit {
    url="https://github.com/linux-surface/linux-surface.git";
    rev="74e3a9cd99dd21c362f9a674d0bb42a824c39bd8";
    sha256="09andw78kmz9yd37j0r00y1za2j9n0x6g47b1gyijsglj9yzr7lm";
  };

  ath10k-firmware = fetchgit {
    url="https://github.com/kvalo/ath10k-firmware";
    rev="84b47062aab31d67156e0a3ef593a6999a12864b";
    sha256="0l8wfj8z4jbb31nzqkaxisby0n6061ix01c5di9bq66iby59j8py";
  };

    surface-go-ath10k-firmware = fetchurl {
    url="https://support.killernetworking.com/K1535_Debian/board.bin";
    # url="https://www.killernetworking.com/support/K1535_Debian/board.bin";
    sha256="0l8wfj8z4jbb31nzqkaxisby0n6061ix01c5di9bq66iby59j8py";
  };

}
