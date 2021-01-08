{stdenv, pkgs}:
let
  repos = (pkgs.callPackage ../repos.nix {});
in
stdenv.mkDerivation {
  name = "microsoft-surface-ath10k-firmware";
  src = repos.surface-ath10k-firmware;
  priority = 1;

  # NOTE: It appears that only the QCA6174 directory is needed, to support the Surface Go:
  installPhase = ''
    mkdir -p $out/lib/firmware/ath10k
    cp -r $src/QCA6174 $out/lib/firmware/ath10k/
  '';
}
