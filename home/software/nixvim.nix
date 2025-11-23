{ nixvim, pkgs, ... }: {
  imports = [ nixvim.homeModules.nixvim ];
  programs.nixvim = {
    enable = true;

    opts = {
      colorcolumn = "81";
      # cursorcolumn = true;
      cursorline = true;
      relativenumber = true;

      # tab
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };

    plugins = {
      lsp.enable = true;

      aerial = {
        enable = true;
        settings = {
          default_direction = "prefer_right";
          open_automatic = true;
          placement = "edge";
          show_guides = true;
          layout = {
            max_width = 36;
            min_width = 36;
          };
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "nvim_lsp_signature_help"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
        };
      };
      
      indent-blankline = {
        enable = true;
        settings = {
          indent.char = "│";
        };
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
    } {
      event = ["FileType"];
      pattern = [ "aerial" ];
      command = ''
        set relativenumber
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
