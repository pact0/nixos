{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    entr # perform action when file change
    libreoffice
    nix-prefetch-github
    pipx # Install Python applications in isolated environments
    #prismlauncher                     # minecraft launcher
    # rnix-lsp
    soundwireserver # pass audio to android phone
    youtube-dl
    gnome.zenity

    # C / C++
    gcc
    gnumake

    gparted # partition manager
    ffmpeg
    imv # image viewer
    libnotify
    man-pages # extra man pages
    ncdu # disk space
    openssl
    qalculate-gtk # calculatoru mnie na skt
    unzip
    xdg-utils
    signal-desktop-beta
    cava
    xfce.thunar
  ];
}
