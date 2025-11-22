{ hostname, ... }: {
  system.autoUpgrade = {
    enable = true;
    flake = "~/nixosConfigurations#{hostname}";
    dates = "daily";
    persistent = true;
    # `channel` conflicts with `flake`.
    # channel = "https://nixos.org/channels/nixos-unstable";
  };
}
