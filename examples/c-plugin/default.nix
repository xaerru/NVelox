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
  shellHook = ''
    export NIX_CFLAGS_COMPILE="$NIX_CFLAGS_COMPILE -isystem ${nvelox}/include/nvelox -isystem ${nvelox}/include/nvelox/nvim-include -isystem ${nvelox}/include/nvelox/nvim-config -isystem ${nvelox}/include/nvelox/nvim-auto"
  '';
}
