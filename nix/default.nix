{ pkgs ? import <nixpkgs> { } }:

let
  nvelox-neovim = import ./nvelox-neovim.nix { inherit pkgs; };
  gitignoreSrc = pkgs.fetchFromGitHub {
    owner = "hercules-ci";
    repo = "gitignore.nix";
    rev = "5b9e0ff9d3b551234b4f3eb3983744fa354b17f1";
    sha256 = "sha256-o/BdVjNwcB6jOmzZjOH703BesSkkS5O7ej3xhyO8hAY=";
  };
  inherit (import gitignoreSrc { inherit (pkgs) lib; }) gitignoreSource;
in pkgs.stdenv.mkDerivation {
  name = "nvelox";
  src = gitignoreSource ../.;
  buildInputs = nvelox-neovim.buildInputs ++ [ nvelox-neovim ];
  dontFixCmake = true;
  nativeBuildInputs = nvelox-neovim.nativeBuildInputs;
  NVELOX_NEOVIM_CMAKE_FLAGS = builtins.concatStringsSep ";" nvelox-neovim.cmakeFlags;
  makeTarget = "nvelox";
  enableParallelBuilding = true;
}
