with (import <nixpkgs> {});

pkgs.neovim-unwrapped.overrideAttrs (oa: {
  name = "nvelox-neovim";
  src = fetchFromSourcehut {
    owner = "~xaerru";
    repo = "nvelox-neovim";
    rev = "a2894e0bc91c81fea68d74e15c80bbc1a58d77d8";
    sha256 = "sha256-TtF7ptoNTo7jJaFhnUnJQ9dIObigSgrgYxyUBjXCgSc";
  };
  postInstall = ''
    mv $out/bin/nvim $out/bin/nvlx
  '';
})
