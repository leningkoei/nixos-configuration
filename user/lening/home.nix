{ ... }: {
  imports = [
    ../../home/public.nix
    ../../home/desktop/default.nix

    ../../home/software/lean.nix
    ../../home/software/neofetch.nix
    ../../home/software/nixvim.nix
    ../../home/software/tmux.nix
    ../../home/software/tree.nix
    ../../home/software/vscode.nix
  ];

  programs.git = {
    enable = true;
    userName = "leningkoei";
    userEmail = "zhanglening2001@gmail.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # bashrc
    bashrcExtra = ''
    '';
    # aliases
    shellAliases = {
      # foo = "bar --parameter argument";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-configuration";
    };
  };
}

