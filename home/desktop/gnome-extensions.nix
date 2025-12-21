{ pkgs, ... }: {
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    kimpanel
    vitals
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "blur-my-shell@aunetx"
        "kimpanel@kde.org"
        "Vitals@CoreCoding.com"
      ];
    };
  };
}

