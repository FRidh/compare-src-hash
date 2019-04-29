{ nixpkgs ? builtins.fetchGit {
    url = https://github.com/NixOS/nixpkgs.git;
    ref = "release-19.03";
    rev = "246ac89c2b068b5534f7a140767ebe2f897e18fb";
  }
}:

with import nixpkgs {};

stdenv.mkDerivation {
  name = "foo";

  src = let
    whitelist = [
      "^foo.*"
    ];
  in stdenv.lib.sourceByRegex ./. whitelist;

  installPhase = ''
    mkdir -p $out
    cp foo $out/
  '';
}
