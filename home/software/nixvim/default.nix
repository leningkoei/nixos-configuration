{ nixvim, pkgs, ... }: {
  imports = [ nixvim.homeModules.nixvim ];
  programs.nixvim = {
    enable = true;
    imports = [
      ./autoCmd.nix
      ./colorscheme.nix
      ./keymaps.nix
      ./opts.nix
      ./plugins/default.nix
    ];
  };
}

