{ pkgs, ... }:

{
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    # Command Line
    disfetch neofetch lolcat cowsay onefetch starfetch
    cava
    gnugrep gnused
    killall
    libnotify
    timer
    bat eza fd bottom ripgrep
    rsync
    tmux
    htop
    hwinfo
    unzip
    brightnessctl
    w3m
    fzf
    pandoc
    pciutils
  ];

}
