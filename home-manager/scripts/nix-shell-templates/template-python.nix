{
  description = "Minimal python nix-shell";

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
        (
          pkgs.python3.withPackages (python-pkgs: [
          ])
        )
        pkgs.bash
      ];

      shellHook = ''
        export shell=${pkgs.bash}
        python --version
      '';
    };
  };
}
