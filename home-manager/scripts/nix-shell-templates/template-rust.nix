{
  description = "Minimal rust nix-shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux"; # change if needed (e.g. aarch64-darwin)
    pkgs = import nixpkgs { inherit system; };
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      packages = [
        pkgs.bash
        pkgs.rustc
        pkgs.cargo
      ];

      shellHook = ''
        export shell=${pkgs.bash}
        cargo --version
        rustc --version
      '';
    };
  };
}
