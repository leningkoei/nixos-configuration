{ pkgs, ... }: {
  home.packages = [ pkgs.alacritty ];
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 9.9;
      window = {
        decorations = "none";
        opacity = 0.81;
      };
    };
  };
}

