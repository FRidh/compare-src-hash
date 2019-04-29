{ nixpkgs ? builtins.fetchGit {
    url = https://github.com/NixOS/nixpkgs.git;
    ref = "release-19.03";
    rev = "246ac89c2b068b5534f7a140767ebe2f897e18fb";
  }
}:

let
  src = fetchGit {
    url = "https://github.com/FRidh/compare-src-hash";
    ref = "master";
    rev = "88b136e01d42a06b346aa9ec97e7d802a175a8c8";
  };
in import src {inherit nixpkgs;}
