with (import <nixpkgs> {});

pkgs.neovim-unwrapped.overrideAttrs (oa: {
  name = "nvelox-neovim";
  src = fetchFromSourcehut {
    owner = "~xaerru";
    repo = "nvelox-neovim";
    rev = "c82da06c0c63ae9b84ba1394addf077f9d29ce27";
    sha256 = "ega9SfdKvei+2dp9cgmWrsxqSmwuOKlhUXF2UpWYKic=";
  };
  postFixup = let
    libPath = lib.makeLibraryPath [ (import ./default.nix) ];
  in ''
    patchelf --add-rpath ${libPath} $out/bin/nvim
    '';
})
