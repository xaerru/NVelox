with (import <nixpkgs> {});

stdenv.mkDerivation {
  name = "nvelox";
  src = ./.;
  buildInputs = [ cmake ];
  makeTarget = "nvelox";
  enableParallelBuilding = true;
}
