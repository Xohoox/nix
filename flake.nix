{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    themr = {
      url = "github:Xohoox/themr";
      # url = "/home/fynn/rep/themr"; # only for development
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nur, themr, ... }@inputs: 
    let
    system = "x86_64-linux";
    in {
      nixosConfigurations.amadeus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.default
          nur.modules.nixos.default

          {
            environment.systemPackages = [
              themr.packages.${system}.default
            ];
          }

        ];
    };
  };
}
