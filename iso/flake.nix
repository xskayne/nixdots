{
  description = "Basic NixOS installation media";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        iso = nixpkgs.lib.nixosSystem {
          modules = [
            ./configuration.nix
          ];
        };
      };
    };
}
