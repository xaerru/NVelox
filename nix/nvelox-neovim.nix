with (import <nixpkgs> {});

pkgs.neovim-unwrapped.overrideAttrs (oa: {
  name = "nvelox-neovim";
  src = fetchFromSourcehut {
    owner = "~xaerru";
    repo = "nvelox-neovim";
    rev = "129bbcde047ed1ec1eb111ac1298280f7fc2a944";
    sha256 = "3VExRq/fFGWB1ljcqDDUMhJLldJQDXgMuMVvZNc1TB0=";
  };
  postFixup = let
    libPath = lib.makeLibraryPath [ (import ./default.nix) ];
  in ''
    patchelf --add-rpath ${libPath} $out/bin/nvim
    '';
})
