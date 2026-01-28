{
  description = "Haskell MOOC";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              ghc
              stack
              cabal-install
              haskell-language-server
              haskellPackages.stan
              ghcid
              fourmolu
              go-task
              zlib
            ];
          };
        });
}
