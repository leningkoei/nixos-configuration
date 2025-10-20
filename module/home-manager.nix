{ home-manager, specialArgs, username, ... }: {
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
  home-manager.extraSpecialArgs = specialArgs;
  home-manager.users.${username} = import ../user/${username}/home.nix;
}
