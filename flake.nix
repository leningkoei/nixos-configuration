{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixos-wsl, ... }@inputs: {
    nixosConfigurations = {
      shen-zhou-pc = nixpkgs.lib.nixosSystem {
        specialArgs = inputs // {
          username = "lening";
          hostname = "shen-zhou-pc";
        };
        modules = [
          home-manager.nixosModules.home-manager

          ./host/shen-zhou-pc/configuration.nix
          ./module/default.nix
          # ./module/font.nix
          # ./module/input-method.nix
          # ./module/home-manager.nix
        ];
      };

      visual-box-vm-dell-pc = nixpkgs.lib.nixosSystem {
        specialArgs = inputs // {
          username = "lening";
          hostname = "visual-box-vm-dell-pc";
        };
        modules = [
          home-manager.nixosModules.home-manager

          ./host/visual-box-vm-dell-pc/configuration.nix
          ./module/default.nix
          # ./module/font.nix
          # ./module/input-method.nix
          # ./module/home-manager.nix
        ];
      };

      dell-pc-wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs // {
          username = "leningwsl";
          hostname = "dell-pc-wsl";
        };
        modules = [
          home-manager.nixosModules.home-manager
          nixos-wsl.nixosModules.wsl
          ./host/dell-pc-wsl/configuration.nix
          ./module/home-manager.nix
          ./module/auto-working/default.nix
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

