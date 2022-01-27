with (import <nixpkgs> {});

let
nvelox-neovim = import ./nix/nvelox-neovim.nix;
in
mkShell {
  nativeBuildInputs = [
    cmake
  ];
  buildInputs = [
    nvelox-neovim
  ];
  shellHook = ''
    export NVELOX_PATH=build/
  '';
}
