{ pkgs, ... }: {
  home.packages = [ pkgs.tree ];
  # programs.tree.enable = true;
}

