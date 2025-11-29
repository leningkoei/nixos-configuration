{ ... }: {
  keymaps = [
    # Allow use <ESC> to escape from nvim's terminal mode to normal mode.
    {
      mode = "t";
      key = "<ESC>";
      action = "<C-\\><C-n>";
    }
  ];
}

