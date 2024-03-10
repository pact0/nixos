{aliases, ...}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = aliases;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "fzf" "zoxide" "docker" "docker-compose" "history-substring-search" "vi-mode" "zsh-interactive-cd"];
    };
    # initExtra = ''
    #   VI_MODE_SET_CURSOR=true
    # '';
  };
}
