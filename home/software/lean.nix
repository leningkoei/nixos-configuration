{ pkgs, ... }: {
  home.packages = [ pkgs.elan ];

  programs.nixvim.plugins.lean = {
    enable = true;

    settings = {
      infoview.width = 100;
    };
  };
}

