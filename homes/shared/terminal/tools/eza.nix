{config, ...}: {
  programs.eza = {
    enable = true;
    git = true;

    enableBashIntegration = config.programs.bash.enable;
    enableZshIntegration = config.programs.zsh.enable;
    enableFishIntegration = config.programs.fish.enable;

    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };
}
