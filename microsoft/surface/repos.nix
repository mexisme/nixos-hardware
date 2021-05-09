{ lib, pkgs, fetchFromGitHub, fetchurl }:
{
  linux-surface = fetchFromGitHub {
    owner="linux-surface";
    repo="linux-surface";
    rev="0354357d1b8b705995c6f743c2d8bf0c6a6422eb";
    sha256="0v8hi4cpkiy6lwgs11alwhwvm8dj051j6g3rcq1f4kzv0hcwylnj";
  };

  ath10k-firmware = fetchFromGitHub {
    owner="kvalo";
    repo="ath10k-firmware";
    rev="84b47062aab31d67156e0a3ef593a6999a12864b";
    sha256="0l8wfj8z4jbb31nzqkaxisby0n6061ix01c5di9bq66iby59j8py";
  };

  surface-go-ath10k-firmware_upstream = fetchurl {
    url="https://support.killernetworking.com/K1535_Debian/board.bin";
    # url="https://www.killernetworking.com/support/K1535_Debian/board.bin";
    sha256="0l8wfj8z4jbb31nzqkaxisby0n6061ix01c5di9bq66iby59j8py";
  };

  surface-go-ath10k-firmware_backup = fetchFromGitHub {
    owner="mexisme";
    repo="linux-surface_ath10k-firmware";
    rev="74e5409e699383d6ca2bc4da4a8433d16f3850b1";
    sha256="169vgvxpgad9anmchs22fj5qm6ahzjfdnwhd8pc280q705vx6pjk";
  };
}
