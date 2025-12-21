{ hostname, ... }: {
  imports = [
    ../../home/public.nix

    ../../home/software/direnv.nix
    # ../../home/software/gcc.nix
    # ../../home/software/lean.nix
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
      flake_home=$nix_home#${hostname}
    '';
    # aliases
    shellAliases = {
      # foo = "bar --parameter argument";
      checknix = "(cd $nix_home && git add .) && \
sudo nixos-rebuild dry-build --flake $flake_home";
      buildnix = "sudo nixos-rebuild build --flake $flake_home";
      trynix = "sudo nixos-rebuild test --flake $flake_home";
      switchnix = "sudo nixos-rebuild switch --flake $flake_home";
    };
  };
}


