{ pkgs, ... }: {
  # home.packages = [ pkgs.vscode ];
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      userSettings = {
        # 设置字体大小
        "editor.fontSize" = 12;
        # 设置字体
        "editor.fontFamily" = "'NotoSansM Nerd Font Mono'";
        # 设置tab长度
        "editor.tabSize" = 2;
        "workbench.colorTheme" = "GitHub Dark Default";
        # 禁用信任询问，默认信任所有文件
        "security.workspace.trust.enabled" = false;
      };
      extensions = with pkgs.vscode-extensions; [
        github.github-vscode-theme
        vscodevim.vim
      ];
    };
  };
}

