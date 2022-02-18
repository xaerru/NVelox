{pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
    buildInputs = [(import ../../nix/default.nix {inherit pkgs;})];
}
