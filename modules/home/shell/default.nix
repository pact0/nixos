{pkgs, ...}: let
  aliases = {
    cat = "bat";
    htop = "btop";
    top = "btop";
    fd = "fd -Lu";
    v = "nvim";
    #nixos-rebuild = "systemd-run --no-ask-password --uid=0 --system --scope -p MemoryLimit=16000M -p CPUQuota=60% nixos-rebuild";
    rebuild = "sudo nixos-rebuild switch --show-trace --flake .#nixos";
    installed = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq | cat";
    installedall = "nix-store --query --requisites /run/current-system | cat";
    cleanup = "sudo nix-collect-garbage --delete-older-than 1d";
    listgen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
    nixremove = "nix-store --gc";
    bloat = "nix path-info -Sh /run/current-system";

    l = "ls -ahl";
    ls = "eza --icons -l -T -L=1";
    la = "eza -a --icons";
    ll = "eza -l --icons";

    n = "neofetch";
    # nf = ''nvim (FZF_DEFAULT_COMMAND='fd' FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'" fzf --height 60% --layout reverse --info inline --border')'';
    g = "git";

    c = "clear";
    #cd = "z";
    q = "exit";
    grep = "rg";
    rm = "rip";
    undorm = "rip -u";
  };
in {
  imports = [
    (import ./fish {inherit aliases pkgs;})
    (import ./bash.nix {inherit aliases;})
    (import ./zsh.nix {inherit aliases;})
    (import ./starship.nix)
    (import ./programs.nix)
    (import ./nnn.nix)
    (import ./scripts)
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    tmux = {
      enableShellIntegration = true;
    };
  };

   programs.direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
}
