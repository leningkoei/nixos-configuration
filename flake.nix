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

      shen-zhou-pc = let
        username = "lening";
        homepath = "../../home";
        specialArgs = { inherit username; inherit homepath; };
      in nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./host/shen-zhou-pc/configuration.nix
          ./module/font.nix
          home-manager.nixosModules.home-manager {
            # By default, Home Manager uses a private pkgs instance that is
            # configured via the `home-manager.users.<name>.nixpkgs` options. To
            # instead use the global pkgs that is configured via the system
            # level nixpkgs options, set this attribute. This saves an extra
            # Nixpkgs evaluation, adds consistency, and removes the dependency on
            # `NIX_PATH`, which is otherwise used for importing Nixpkgs.
            home-manager.useGlobalPkgs = true;
            # By default packages will be installed to `$HOME/.nix-profile` but
            # they can be install to `/etc/profiles` if this attribute is added
            # to the system configuration. This is necessary if, for example,
            # you wish to use `nixos-rebuild build-vm`. This option may become
            # the default value in the future.
            home-manager.useUserPackages = true;
            home-manager.users.${username} = ./users/${username}/home.nix;
            home-manager.extraSpecialArgs = inputs // specialArgs;
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

