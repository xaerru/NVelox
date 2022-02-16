{ pkgs ? import <nixpkgs> { } }:

let
  gitignoreSrc = pkgs.fetchFromGitHub {
    owner = "hercules-ci";
    repo = "gitignore.nix";
    rev = "5b9e0ff9d3b551234b4f3eb3983744fa354b17f1";
    sha256 = "sha256-o/BdVjNwcB6jOmzZjOH703BesSkkS5O7ej3xhyO8hAY=";
  };
  inherit (import gitignoreSrc { inherit (pkgs) lib; }) gitignoreSource;
in pkgs.neovim-unwrapped.overrideAttrs (oa: {
  name = "nvelox-neovim";
  src = gitignoreSource ../external/nvelox-neovim;
  dontStrip = true;
  nativeBuildInputs = oa.nativeBuildInputs ++ (with pkgs; [ ninja ]);
  NIX_CFLAGS_COMPILE = " -ggdb3 -Og";
  cmakeFlags = oa.cmakeFlags ++ [ "-DCMAKE_BUILD_TYPE=Debug" "-GNinja" ];
  disallowedReferences = [ ];
  postInstall = ''
    mv -v $out/bin/nvim $out/bin/nvlx
  '';
})
