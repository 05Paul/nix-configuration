{
  description = "Dotfiles using nix and home-manager";
  
  inputs = {
    nixpkgs = {
       url = "github:NixOS/nixpkgs/nixos-26.05";
    };

    nixpkgs-unstable = {
       url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-26.05";
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
          arch ? x86,
          dir,
          nixpkgs ? inputs.nixpkgs,
          nixpkgs-unstable ? inputs.nixpkgs-unstable,
          home-manager ? inputs.home-manager,
          home-manager-unstable ? inputs.home-manager-unstable,
          modules ? [],
          home-manager-modules ? [],
          home-manager-extra-special-args ? {},
        }:
        nixpkgs.lib.nixosSystem {
          system = arch;
          specialArgs = let
            system = arch;
          in {
            pkgs-un = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = [
            ./hosts/${dir}/configuration.nix
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.sharedModules = [
                inputs.nixvim.homeModules.nixvim
              ] ++ home-manager-modules;
              home-manager.extraSpecialArgs = {
                pkgs-unstable = nixpkgs-unstable.legacyPackages.${arch};
                home-manager-unstable = home-manager-unstable;
              } // home-manager-extra-special-args;
            }
          ] ++ modules;
        };
    in 

    {
      nixosConfigurations.nixos = mkNixOSConfiguration {
        dir = "nixos-vm";
      };
      
      nixosConfigurations.nixos-desktop = mkNixOSConfiguration {
        dir = "nixos-desktop";
        modules = [
          inputs.nix-flatpak.nixosModules.nix-flatpak
        ];
        home-manager-modules = [
          inputs.spicetify.homeManagerModules.spicetify
        ];
        home-manager-extra-special-args = {
          spicetify = inputs.spicetify;
        };
      };

      nixosConfigurations.nixos-laptop = mkNixOSConfiguration {
        dir = "nixos-laptop";
        modules = [
          inputs.nixos-hardware.nixosModules.framework-12th-gen-intel
          inputs.nix-flatpak.nixosModules.nix-flatpak
        ];
        home-manager-modules = [
          inputs.spicetify.homeManagerModules.spicetify
        ];
        home-manager-extra-special-args = {
          spicetify = inputs.spicetify;
        };
      };

      nixosConfigurations.nixos-compute-1 = mkNixOSConfiguration {
        dir = "nixos-compute-1";
      };

      nixosConfigurations.nixos-compute-2 = mkNixOSConfiguration {
        dir = "nixos-compute-2";
      };

      nixosConfigurations.nixos-compute-3 = mkNixOSConfiguration {
        dir = "nixos-compute-3";
      };

      nixosConfigurations.nixos-wings = mkNixOSConfiguration {
        dir = "nixos-wings";
      };

      nixosConfigurations.nixos-proxy-2 = mkNixOSConfiguration {
        dir = "nixos-proxy-2";
      };

      nixosConfigurations.nixos-dockge = mkNixOSConfiguration {
        dir = "nixos-dockge";
      };
    };
}
