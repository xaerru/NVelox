{ pkgs ? import <nixpkgs> { } }:

pkgs.neovim-unwrapped.overrideAttrs (oa: {
  name = "nvelox-neovim";
  src = ../external/nvelox-neovim;
  dontStrip = true;
  NIX_CFLAGS_COMPILE = " -ggdb3 -Og";
  cmakeFlags = oa.cmakeFlags ++ [ "-DCMAKE_BUILD_TYPE=Debug" ];
  disallowedReferences = [];
  postInstall = ''
    mv -v $out/bin/nvim $out/bin/nvlx
  '';
})
