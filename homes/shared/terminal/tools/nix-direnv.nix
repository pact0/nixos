{config, ...}: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    silent = true;

    enableBashIntegration = config.programs.bash.enable;
    enableZshIntegration = config.programs.zsh.enable;
    enableFishIntegration = config.programs.fish.enable;
  };
}
