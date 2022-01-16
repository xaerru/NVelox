with (import <nixpkgs> {});

mkShell {
  nativeBuildInputs = [(import ./default.nix) (import ./nvelox-neovim.nix)];
}
