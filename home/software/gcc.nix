{ pkgs, ... }: {
  home.packages = with pkgs; [
    gcc
  ];
  programs.gcc.enable = true;
}

