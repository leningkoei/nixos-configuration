{ ... }: {
  autoCmd = [
    {
      event = ["FileType"];
      pattern = [ "*" ];
      command = ''
        set indentexpr=
        set relativenumber
      '';
    }
    # {
    #   event = ["FileType"];
    #   pattern = [ "aerial" ];
    #   command = ''
    #     set relativenumber
    #   '';
    # }
  ];
}

