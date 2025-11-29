{ ... }: {
  imports = [
    ../../home/public.nix
    ../../home/desktop/default.nix

    ../../home/software/alacritty.nix
    ../../home/software/lean.nix
    ../../home/software/neofetch.nix
    ../../home/software/nixvim/default.nix
    ../../home/software/tmux.nix
    ../../home/software/tree.nix
    ../../home/software/vscode.nix
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "leningkoei";
        email = "zhanglening2001";
      };
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # bashrc
    bashrcExtra = ''
      nix_home=~/nixos-configuration/
    '';
    # aliases
    shellAliases = {
      # foo = "bar --parameter argument";
      check = "git add $nix_home && nixos-rebuild dry-build --flake $nix_home";
      build = "nixos-rebuild build --flake $nix_home";
      rebuild = "sudo nixos-rebuild test --flake $nix_home";
      switch = "sudo nixos-rebuild switch --flake $nix_home";
    };
  };
}

