{
  description = "My NixOS Configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x88_64-linux";
      modules = [ 
        ./shared.nix 
        ./desktop.nix
        
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jake = import ./home.nix;
        }

         ];
    };

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x88_64-linux";
      modules = [ 
        ./shared.nix 
        ./laptop.nix
        
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jake = import ./home.nix;
        }

         ];
    };

  };
}
