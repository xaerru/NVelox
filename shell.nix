with (import <nixpkgs> {});

let
nvelox-neovim = pkgs.neovim.overrideAttrs (oa: {
  name = "nvelox-neovim";
  src = fetchFromSourcehut {
    owner = "~xaerru";
    repo = "nvelox-neovim";
    rev = "08bbea4ae1ee8266e637546dfe29944fbf78e3cb";
    sha256 = "hqcwZjHRMFmXiTAKBs9Yqfml10S8F5we4S56ovrKkZo=";
  };
});
in
mkShell {
  nativeBuildInputs = [nvelox-neovim];
}
