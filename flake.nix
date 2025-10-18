{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {

      shen-zhou-pc = let
        username = "lening";
        homepath = "../../home";
        specialArgs = { inherit username; inherit homepath; };
      in nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./host/shen-zhou-pc/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} = import ./users/${username}/home.nix;
          }
        ];
      };

      nixos = let
        username = "lening";
        homepath = "../../home";
        specialArgs = { inherit username; inherit homepath; };
      in nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          # ./configuration.nix
          ./host/visual-box-vm/configuration.nix
          ./host/visual-box-vm/hardware-configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} = import ./users/${username}/home.nix;
          }
        ];
      };
    };
  };
}

# {
#   description = "A simple NixOS flake";
# 
#   inputs = {
#     # NixOS official package source, using the nixos-25.05 branch here
#     nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
#   };
# 
#   outputs = { self, nixpkgs, ... }@inputs: {
#     nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
#       modules = [
#         # Import the previous configuration.nix we used,
#         # so the old configuration file still takes effect
#         ./configuration.nix
#       ];
#     };
#   };
# }

