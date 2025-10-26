{ config, pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.noto
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "NotoSerif NF"
          "Noto Serif CJK SC"
          "Noto Serif CJK TC"
          "Noto Serif CJK JP"
          "Noto Serif CJK KR"
        ];
        sansSerif = [
          "NotoSans NF"
          "Noto Sans CJK SC"
          "Noto Sans CJK TC"
          "Noto Sans CJK JP"
          "Noto Sans CJK KR"
        ];
        monospace = [ "NotoMono NF" ];
      };
    };
  };
}

