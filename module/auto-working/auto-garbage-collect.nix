{ ... }: {
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 30d";
    persistent = true;
  };
  nix.settings.auto-optimise-store = true;
}

