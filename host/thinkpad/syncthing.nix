{ username, ... }: {
  services.syncthing = {
    enable = true;
    user = "${username}";
    dataDir = "/home/${username}/syncthing-repo/";
    configDir = "/home/${username}/.config/syncthing";
  };
}

