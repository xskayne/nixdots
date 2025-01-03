{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    {
      nixosConfigurations = {
        ranni = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/ranni/configuration.nix
            ./hosts/ranni/hardware-configuration.nix
          ];
        };

        godrick = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/godrick/configuration.nix
            ./hosts/godrick/hardware-configuration.nix
          ];
        };
      };
    };
}
