{ homepath, ... }: {
  imports = [
    ./${homepath}/public.nix

    ./${homepath}/software/neofetch.nix
    ./${homepath}/software/tmux.nix
    ./${homepath}/software/tree.nix
    ./${homepath}/software/nixvim.nix
  ];

  # home.packages = with pkgs; [
  #   neofetch
  #   tmux
  #   tree
  # ];

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

