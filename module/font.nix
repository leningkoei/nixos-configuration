{ config, pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.noto
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "NotoSerif NF" ];
        sansSerif = [ "NotoSans NF" ];
        monospace = [ "NotoMono NF" ];
      };
    };
  };
}

