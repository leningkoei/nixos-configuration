{ pkgs, ... }: {
  home.packages = with pkgs.gnomeExtensions; [
    kimpanel
    vitals
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "kimpanel@kde.org"
        "Vitals@CoreCoding.com"
      ];
    };
  };
}

