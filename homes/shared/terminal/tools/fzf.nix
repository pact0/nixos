{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.fzf = {
    enable = true;
    defaultCommand = "${lib.getBin pkgs.fd}/bin/fd --type=d --hidden --exclude=.git";
    fileWidgetCommand = "${pkgs.fd}/bin/fd --type f --hidden --exclude=.git";
    defaultOptions = [
      "--layout=reverse" # Top-first.
      "--exact" # Substring matching by default, `'`-quote for subsequence matching.
      "--bind=alt-p:toggle-preview,alt-a:select-all"
      "--multi"
      "--no-mouse"
      "--info=inline"

      "--ansi"
      "--with-nth=1.."
      "--pointer=' '"
      "--pointer=' '"
      "--header-first"
      "--border=rounded"
    ];

    tmux = {
      enableShellIntegration = config.programs.tmux.enable;
    };

    enableBashIntegration = config.programs.bash.enable;
    enableZshIntegration = config.programs.zsh.enable;
    enableFishIntegration = config.programs.fish.enable;
  };
}
