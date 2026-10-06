{
  description = "DevShell";

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      perSystem = {pkgs, ...}: let
      in {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            typst
            typstyle
            tinymist

            zathura
          ];
        };
      };

      systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
}
