with (import <nixpkgs> { });
let nvelox = import ../../nix/default.nix;
in stdenv.mkDerivation {
  name = "nvelox-c";
  src = ./.;
  nativeBuildInputs = [ cmake ];
  buildInputs = [ nvelox ];
  makeTarget = "c-plugin";
  cmakeFlags = ["-DCMAKE_INSTALL_PREFIX=/usr"];
  enableParallelBuilding = true;
}
