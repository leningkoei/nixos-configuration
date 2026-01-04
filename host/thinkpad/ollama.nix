{ ... }: {
  services.ollama = {
    enable = true;

    loadModels = [ "qwen3:8b" ];
  };
}

