{
  description = "Minimal java nix-shell";

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
        pkgs.jdk25
        pkgs.bash
      ];

      shellHook = ''
        export shell=${pkgs.bash}
        export JAVA_HOME=${pkgs.jdk25}/lib/openjdk
        java -version
      '';
    };
  };
}
