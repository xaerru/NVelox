with (import <nixpkgs> {});

mkShell {
  nativeBuildInputs = [(import ./nix/default.nix) (import ./nix/nvelox-neovim.nix)];
}
