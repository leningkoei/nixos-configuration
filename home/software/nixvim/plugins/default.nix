{ lib, ... }: {
  plugins = {
    lsp.enable = true;
    web-devicons.enable = true;

    aerial = import ./aerial.nix;
    cmp = import ./cmp.nix;
    indent-blankline = import ./indent-blankline.nix;
    nvim-tree = import ./nvim-tree.nix;
  };
}

