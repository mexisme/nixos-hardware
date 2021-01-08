{stdenv, pkgs}:
let
  repos = (pkgs.callPackage ../repos.nix {});
in
stdenv.mkDerivation {
  name = "microsoft-surface-ath10k-firmware";
  src = repos.linux-kernel-firmware;
  priority = 1;
  dontBuild = true;

  # NOTE: It appears that only the QCA6174 directory is needed, to support the Surface Go, currently:
  installPhase = ''
    mkdir -p $out/lib/firmware/ath10k
    cp -r $src/ath10k/QCA6174 $out/lib/firmware/ath10k/
  '';
}
