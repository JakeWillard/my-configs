{
  description = "My NixOS Configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x88_64-linux";
      modules = [ 
        ./common.nix
        ./hosts/desktop.nix

        inputs.stylix.nixosModules.stylix
        
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jake.imports = [ ./users/jake.nix];
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
        }

         ];
    };

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x88_64-linux";
      modules = [ 
        ./common.nix 
        ./hosts/laptop.nix

        inputs.stylix.nixosModules.stylix
        
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jake.imports = [ ./users/jake.nix];
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
        }

         ];
    };

  };
}
