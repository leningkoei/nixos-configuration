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
      lsp = {
        enable = true;
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

    extraPlugins = with pkgs.vimPlugins; [
      plenary-nvim
      lean-nvim
    ];

    extraConfigLua = ''
      vim.api.nvim_create_autocmd(
        { "BufReadPre", "BufNewFile" },
        {
          pattern = "*.lean",
          callback = function()
            require("lean").setup({
              mappings = true,
              infoview = {
                width = 100,
              },
            })
          end,
        }
      )
    '';

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
