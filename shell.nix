with (import <nixpkgs> {});

mkShell {
  nativeBuildInputs = [
    cmake
  ];
}
