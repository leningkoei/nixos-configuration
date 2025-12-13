{ pkgs, ... }: {
  # home.packages = [ pkgs.vscode ];
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      userSettings = {
        # 设置不使用enter键插入suggest
        "editor.acceptSuggestionOnEnter" = "off";
        # 设置不自动闭合括号与引号
        "editor.autoClosingBrackets" = "never";
        "editor.autoClosingQuotes" = "never";
        # 设置字体大小
        "editor.fontSize" = 12;
        # 设置字体
        "editor.fontFamily" = "'JetBrainsMono Nerd Font'";
        # 设置在第80列显示竖线
        "editor.rulers" = [ 80 ];
        # 设置tab长度
        "editor.tabSize" = 2;
        # 禁用信任询问，默认信任所有文件
        "security.workspace.trust.enabled" = false;
        # 设置终端字体大小
        "terminal.integrated.fontSize" = 12;
        # 设置使用vim relative mode
        "vim.smartRelativeLine" = true;
        # 设置每次打开都是最大化窗口
        "window.restoreFullscreen" = true;
        # 设置不保存上次关闭窗口状态
        "window.restoreWindows" = "none";
        # 设置codium主题（`GitHub Dark Default`等需要
        # `github.github-vscode-extensions`插件）
        "workbench.colorTheme" = "GitHub Dark Default";
      };
      extensions = with pkgs.vscode-extensions; [
        github.github-vscode-theme
        vscodevim.vim
      ];
    };
  };
}

