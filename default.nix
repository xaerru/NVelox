with (import <nixpkgs> {});

stdenv.mkDerivation {
  name = "nvelox";
  src = ./.;
  nativeBuildInputs = [ cmake ];
  makeTarget = "nvelox";
  enableParallelBuilding = true;
}
