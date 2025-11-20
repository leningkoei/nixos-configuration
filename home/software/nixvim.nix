{ nixvim, pkgs, ... }: {
  imports = [ nixvim.homeModules.nixvim ];
  programs.nixvim = {
    enable = true;

    opts = {
      colorcolumn = "81";
      cursorcolumn = true;
      cursorline = true;
      relativenumber = true;

      # tab
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };

    plugins = {
      lsp.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };

      nvim-tree = {
        enable = true;
        openOnSetup = true;
        openOnSetupFile = true;
        settings = {
          view.relativenumber = true;
          renderer.indent_markers.enable = true;
        };
      };

      web-devicons.enable = true;
    };

    autoCmd = [{
      event = ["FileType"];
      pattern = [ "*" ];
      command = ''
        set indentexpr=
      '';
    }];

    keymaps = [
      # Allow use <ESC> to escape from nvim's terminal mode to normal mode.
      {
        mode = "t";
        key = "<ESC>";
        action = "<C-\\><C-n>";
      }
    ];
  };
}
