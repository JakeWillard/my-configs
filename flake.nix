{
  description = "My NixOS Configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    home-manager = {
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x88_64-linux";
      modules = [ 
        ./misc/basic.nix
        ./misc/sci.nix
        ./gnome/gnome-sys.nix
        ./hosts/desktop.nix
        
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jake.imports = [ 
            ./users/jake.nix
            ./gnome/gnome-hm.nix
          ];
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
        }

         ];
    };

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x88_64-linux";
      modules = [ 
        ./misc/basic.nix
        ./misc/sci.nix
        ./gnome/gnome-sys.nix
        ./hosts/laptop.nix
        
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jake.imports = [ 
            ./users/jake.nix
            ./gnome/gnome-hm.nix
          ];
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
        }

         ];
    };

  };
}
