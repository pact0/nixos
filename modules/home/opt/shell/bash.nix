{aliases, ...}:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = aliases;
  };

}