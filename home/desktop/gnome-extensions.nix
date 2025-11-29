{ pkgs, ... }: {
  home.packages = with pkgs.gnomeExtensions; [
    kimpanel
    unite
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "kimpanel@kde.org"
      ];
    };
  };
}

