with (import <nixpkgs> {});

pkgs.neovim-unwrapped.overrideAttrs (oa: {
  name = "nvelox-neovim";
  src = fetchFromSourcehut {
    owner = "~xaerru";
    repo = "nvelox-neovim";
    rev = "ceedb0bd5e79edb358ea22a5115e05d57f28d7ed";
    sha256 = "J/9/rde1o3Rz0k5xaSjcjI2jaPaUoYXRAxFlB4OtwFs=";
  };
  postFixup = let
    libPath = lib.makeLibraryPath [ (import ./default.nix) ];
  in ''
    patchelf --add-rpath ${libPath} $out/bin/nvim
    '';
})
