with (import <nixpkgs> {});

mkShell {
  nativeBuildInputs = [
    cmake
    (import ./nix/nvelox-neovim.nix)
  ];
  shellHook = ''
    export NVELOX_PATH=build/
  '';
}
