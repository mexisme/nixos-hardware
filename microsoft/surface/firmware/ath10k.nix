{stdenv, pkgs}:
let
  repos = (pkgs.callPackage ../repos.nix {});
in
stdenv.mkDerivation {
  name = "microsoft-surface-ath10k-firmware";
  src = repos.surface-ath10k-firmware;
  priority = 1;
  installPhase = ''
    mkdir -p $out/lib/firmware/ath10k
    cp -r $src/* $out/lib/firmware/ath10k
  '';
}
