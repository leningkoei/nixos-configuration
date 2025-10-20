{ ... }: {
  imports = [
    ../../home/public.nix

    ../../home/software/elan.nix
    ../../home/software/neofetch.nix
    ../../home/software/nixvim.nix
    ../../home/software/tmux.nix
    ../../home/software/tree.nix
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
      # foo = "bar --version para";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-configuration";
    };
  };
}

