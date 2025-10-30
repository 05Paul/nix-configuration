{
  description = "Dotfiles using nix and home-manager";
  
  inputs = {
    nixpkgs = {
       url = "github:NixOS/nixpkgs/nixos-25.05";
    };

    nixpkgs-unstable = {
       url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
    };

    hyprshell = {
      url = "github:H3rmt/hyprshell?ref=hyprshell-release";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, ... }@inputs:
    let
      hosts = import ./config/hosts.nix;

      mkNixOSConfiguration = 
        {
          host,
          nixpkgs,
          home-manager,
          pkgs-unstable,
          modules ? [],
        }:
        nixpkgs.lib.nixosSystem {
          system = host.arch;
          specialArgs = {
            inherit host;
          };
          modules = [
            ./hosts/${host.dir}/configuration.nix
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.sharedModules = [
                inputs.nixvim.homeManagerModules.nixvim
              ];
              home-manager.extraSpecialArgs = {
                inherit host;
                hyprshell = inputs.hyprshell;
                pkgs-unstable = pkgs-unstable.legacyPackages.${host.arch};
              };
            }
          ] ++ modules;
        };
    in 

    {
      nixosConfigurations.nixos = mkNixOSConfiguration {
        host = hosts.vm;
        nixpkgs = inputs.nixpkgs;
        pkgs-unstable = inputs.nixpkgs-unstable;
        home-manager = inputs.home-manager;
      };
      
      nixosConfigurations.nixos-desktop = mkNixOSConfiguration {
        host = hosts.desktop;
        nixpkgs = inputs.nixpkgs;
        pkgs-unstable = inputs.nixpkgs-unstable;
        home-manager = inputs.home-manager;
      };

      nixosConfigurations.nixos-laptop = mkNixOSConfiguration {
        host = hosts.laptop;
        nixpkgs = inputs.nixpkgs;
        pkgs-unstable = inputs.nixpkgs-unstable;
        home-manager = inputs.home-manager;
        modules = [
          inputs.nixos-hardware.nixosModules.framework-12th-gen-intel
        ];
      };
    };
}
