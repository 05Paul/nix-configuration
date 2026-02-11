{
  description = "Dotfiles using nix and home-manager";
  
  inputs = {
    nixpkgs = {
       url = "github:NixOS/nixpkgs/nixos-25.11";
    };

    nixpkgs-unstable = {
       url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
    };

    spicetify = {
      url = "github:Gerg-L/spicetify-nix";
    };

  };

  outputs = { self, ... }@inputs:
    let
      x86 = "x86_64-linux";
      mkNixOSConfiguration = 
        {
          arch,
          dir,
          nixpkgs,
          home-manager,
          pkgs-unstable,
          modules ? [],
        }:
        nixpkgs.lib.nixosSystem {
          system = arch;
          specialArgs = let
            system = arch;
          in {
            pkgs-un = import pkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = [
            ./hosts/${dir}/configuration.nix
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.sharedModules = [
                inputs.nixvim.homeModules.nixvim
                inputs.spicetify.homeManagerModules.spicetify
              ];
              home-manager.extraSpecialArgs = {
                pkgs-unstable = pkgs-unstable.legacyPackages.${arch};
                spicetify = inputs.spicetify;
              };
            }
          ] ++ modules;
        };
    in 

    {
      nixosConfigurations.nixos = mkNixOSConfiguration {
        arch = x86;
        dir = "nixos-vm";
        nixpkgs = inputs.nixpkgs;
        pkgs-unstable = inputs.nixpkgs-unstable;
        home-manager = inputs.home-manager;
      };
      
      nixosConfigurations.nixos-desktop = mkNixOSConfiguration {
        arch = x86;
        dir = "nixos-desktop";
        nixpkgs = inputs.nixpkgs;
        pkgs-unstable = inputs.nixpkgs-unstable;
        home-manager = inputs.home-manager;
      };

      nixosConfigurations.nixos-laptop = mkNixOSConfiguration {
        arch = x86;
        dir = "nixos-laptop";
        nixpkgs = inputs.nixpkgs;
        pkgs-unstable = inputs.nixpkgs-unstable;
        home-manager = inputs.home-manager;
        modules = [
          inputs.nixos-hardware.nixosModules.framework-12th-gen-intel
        ];
      };

      nixosConfigurations.nixos-compute-1 = mkNixOSConfiguration {
        arch = x86;
        dir = "nixos-compute-1";
        nixpkgs = inputs.nixpkgs;
        pkgs-unstable = inputs.nixpkgs-unstable;
        home-manager = inputs.home-manager;
      };

      nixosConfigurations.nixos-compute-2 = mkNixOSConfiguration {
        arch = x86;
        dir = "nixos-compute-2";
        nixpkgs = inputs.nixpkgs;
        pkgs-unstable = inputs.nixpkgs-unstable;
        home-manager = inputs.home-manager;
      };

      nixosConfigurations.nixos-compute-3 = mkNixOSConfiguration {
        arch = x86;
        dir = "nixos-compute-3";
        nixpkgs = inputs.nixpkgs;
        pkgs-unstable = inputs.nixpkgs-unstable;
        home-manager = inputs.home-manager;
      };
    };
}
