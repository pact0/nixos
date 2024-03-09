{aliases, ...}:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = aliases;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "fzf" ];
    };
    #initExtra = ''
    #PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
    # %F{green}→%f "
    #RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
    #'';
  };

}