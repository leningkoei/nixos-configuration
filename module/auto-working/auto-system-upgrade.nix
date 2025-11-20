{ ... }: {
  system.autoUpgrade = {
    enable = true;
    dates = "daily";
    persistent = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };
}
