with (import <nixpkgs> {});

stdenv.mkDerivation {
  name = "nvelox";
  src = builtins.fetchGit ../.;
  buildInputs = with pkgs; [ cmake ];
  makeTarget = "nvelox";
  enableParallelBuilding = true;
}
