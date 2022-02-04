{ pkgs ? import <nixpkgs> { } }:

let
  neovim = pkgs.neovim-unwrapped;
  nvelox-neovim = import ./nvelox-neovim.nix { inherit pkgs; };
in pkgs.stdenv.mkDerivation {
  name = "nvelox";
  src = builtins.fetchGit {
    url = ../.;
    submodules = true;
  };
  buildInputs = neovim.buildInputs ++ [ nvelox-neovim ];
  dontFixCmake = true;
  nativeBuildInputs = neovim.nativeBuildInputs;
  NVELOX_NEOVIM_CMAKE_FLAGS = builtins.concatStringsSep ";" neovim.cmakeFlags;
  makeTarget = "nvelox";
  enableParallelBuilding = true;
}
