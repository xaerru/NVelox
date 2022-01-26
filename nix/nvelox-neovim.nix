with (import <nixpkgs> {});

pkgs.neovim-unwrapped.overrideAttrs (oa: {
  name = "nvelox-neovim";
  src = fetchFromSourcehut {
    owner = "~xaerru";
    repo = "nvelox-neovim";
    rev = "51c55c6a488c5fe76b49e594594bd4e0a509a1a1";
    sha256 = "VPN5/igooEuQDRiSWR7qzBZTK+nBecJss5EXxxsVYyc=";
  };
})
