with (import <nixpkgs> { });
with (pkgs.neovim-unwrapped);

stdenv.mkDerivation {
  name = "nvelox";
  src = builtins.fetchGit {
    url = ../.;
    submodules = true;
  };
  inherit buildInputs nativeBuildInputs;
  NVELOX_NEOVIM_CMAKE_FLAGS = builtins.concatStringsSep ";" cmakeFlags;
  makeTarget = "nvelox";
  enableParallelBuilding = true;
}
