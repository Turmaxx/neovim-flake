{
  description = "Brook's NeoVim Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim = {
      url = "github:neovim/neovim";
      flake = false;
    };
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    packages.${system} = {
      default = nixpkgs.legacyPackages.${system}.hello;
    };

    devShells.${system}.default = pkgs.mkShell {
      packages = [
        self.packages.${system}.default
      ];
    };

    formatter.${system} = pkgs.alejandra;
  };
}
