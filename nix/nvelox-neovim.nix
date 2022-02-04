{ pkgs ? import <nixpkgs> { } }:

pkgs.neovim-unwrapped.overrideAttrs (oa: {
  name = "nvelox-neovim";
  src = builtins.fetchGit ../external/nvelox-neovim;
  cmakeFlags = oa.cmakeFlags ++ [ "-DCMAKE_BUILD_TYPE=Debug" ];
})
