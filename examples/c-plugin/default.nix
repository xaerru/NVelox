{pkgs ? import <nixpkgs> {}}:

let
nvelox = import ../../nix/default.nix {inherit pkgs;};
in pkgs.stdenv.mkDerivation {
  name = "nvelox-c";
  src = ./.;
  nativeBuildInputs = with pkgs; [ cmake nvelox ];
  buildInputs = nvelox.buildInputs;
  NIX_CFLAGS_COMPILE = "-isystem ${nvelox}/include/nvelox";
  makeTarget = "c-plugin";
  enableParallelBuilding = true;
}
