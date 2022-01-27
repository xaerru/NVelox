with (import <nixpkgs> {});

pkgs.neovim-unwrapped.overrideAttrs (oa: {
  name = "nvelox-neovim";
  src = fetchFromSourcehut {
    owner = "~xaerru";
    repo = "nvelox-neovim";
    rev = "c409532744e5753b5a885de4670cc7a89a8e61f0";
    sha256 = "sha256-eUlh5TjuJW8XdyDawqZPCsCjTY63WhfycLvVMzhNm2U";
  };
  postInstall = ''
    mv $out/bin/nvim $out/bin/nvlx
  '';
})
