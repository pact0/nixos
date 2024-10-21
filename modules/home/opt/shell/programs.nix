{pkgs, ...}: {
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    # Command Line
    gnugrep
    gnused
    killall
    libnotify
    timer
    bat
    eza
    fd
    zip
    bottom
    ripgrep
    rsync
    htop
    hwinfo
    unzip
    brightnessctl
    w3m
    pandoc
    pciutils
    lazygit
    rm-improved
    kubectl
  ];

  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
    };
  };

  programs.btop = {
    enable = true;

    settings = {
      #color_theme = "dracula";
      theme_background = false;
      update_ms = 500;
    };
  };
}
