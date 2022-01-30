with (import <nixpkgs> { });
let nvelox = import ../../nix/default.nix;
in stdenv.mkDerivation {
  name = "nvelox-c";
  src = ./.;
  buildInputs = [ cmake nvelox ];
  makeTarget = "c-plugin";
  enableParallelBuilding = true;
}
