{ pkgs ? import <nixpkgs> { } }:

pkgs.callPackage ./nix/default.nix { inherit pkgs; }
