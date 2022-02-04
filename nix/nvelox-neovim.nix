{ pkgs ? import <nixpkgs> { } }:

pkgs.neovim-unwrapped.overrideAttrs (oa: {
  name = "nvelox-neovim";
  src = builtins.fetchGit {
    url = ../external/nvelox-neovim;
    rev = "a283565ca8d0ec4d848222c17b38239d0096c978";
  };
  cmakeFlags = oa.cmakeFlags ++ [ "-DCMAKE_BUILD_TYPE=Debug" ];
})
