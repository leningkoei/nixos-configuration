{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      # url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      shen-zhou-pc = nixpkgs.lib.nixosSystem {
        specialArgs = inputs // {
          username = "lening";
        };
        modules = [
          home-manager.nixosModules.home-manager

          ./host/shen-zhou-pc/configuration.nix
          ./module/font.nix
          ./module/home-manager.nix
        ];
      };

      visual-box-vm-dell-pc = nixpkgs.lib.nixosSystem {
        specialArgs = inputs // {
          username = "lening";
        };
        modules = [
          home-manager.nixosModules.home-manager

          ./host/visual-box-vm-dell-pc/configuration.nix
          ./module/font.nix
          ./module/home-manager.nix
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

