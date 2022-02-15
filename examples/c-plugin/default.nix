{pkgs ? import <nixpkgs> {}}:

let
nvelox = import ../../nix/default.nix {inherit pkgs;};
in pkgs.stdenv.mkDerivation {
  name = "nvelox-c";
  src = ./.;
  nativeBuildInputs = with pkgs; [ cmake nvelox ];
  buildInputs = nvelox.buildInputs;
  makeTarget = "c-plugin";
  enableParallelBuilding = true;
}
