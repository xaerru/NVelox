with (import <nixpkgs> {});

pkgs.neovim-unwrapped.overrideAttrs (oa: {
  name = "nvelox-neovim";
  src = fetchFromSourcehut {
    owner = "~xaerru";
    repo = "nvelox-neovim";
    rev = "a283565ca8d0ec4d848222c17b38239d0096c978";
    sha256 = "sha256-R88oi6U2L74FjCycmf9CdUUYtwW7tGCOgS2cteVZJ88";
  };
  postInstall = ''
    mv $out/bin/nvim $out/bin/nvlx
  '';
})
