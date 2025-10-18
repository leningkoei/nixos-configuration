{ nixvim, ... }: {
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
      nvim-tree = {
        enable = true;
        openOnSetup = true;
        openOnSetupFile = true;
        settings = {
          view.relativenumber = true;
        };
      };
    };

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
