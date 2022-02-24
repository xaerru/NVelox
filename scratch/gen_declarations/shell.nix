{pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
    buildInputs = [pkgs.luajitPackages.lpeg];
}
