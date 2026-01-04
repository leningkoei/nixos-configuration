{ ... }: {
  imports = [
    ../../home/public.nix
    ../../home/desktop/default.nix

    ../../home/software/alacritty.nix
    ../../home/software/direnv.nix
    ../../home/software/gcc.nix
    ../../home/software/elan.nix
    # ../../home/software/lean.nix
    ../../home/software/logseq.nix
    ../../home/software/neofetch.nix
    ../../home/software/nixvim/default.nix
    ../../home/software/remmina.nix
    # ../../home/software/rustdesk.nix
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
      checknix = "(cd $nix_home && git add .) && \
sudo nixos-rebuild dry-build --flake $nix_home";
      buildnix = "sudo nixos-rebuild build --flake $nix_home";
      trynix = "sudo nixos-rebuild test --flake $nix_home";
      switchnix = "sudo nixos-rebuild switch --flake $nix_home";
    };
  };
}

