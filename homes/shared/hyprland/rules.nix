{lib, ...}: let
  toRegex = list: "^(${lib.concatStringsSep "|" list})$";

  lowopacity = [
    "quickshell:notifications:overlay"
    "quickshell:osd"
  ];

  highopacity = [
    "vicinae"
    "logout_dialog"
    "quickshell:sidebar"
    "quickshell:popup"
  ];

  no_anim = [
    "quickshell:notifications:overlay"
    "quickshell:sidebar"
    "quickshell:popup"
  ];
in {
  wayland.windowManager.hyprland.settings = {
    # layer rules
    layer_rule = [
      {
        match.namespace = toRegex (lib.concatLists [lowopacity highopacity]);
        blur = true;
      }
      {
        match.namespace = toRegex lowopacity;
        ignore_alpha = 0.2;
      }
      {
        match.namespace = toRegex highopacity;
        ignore_alpha = 0.5;
      }
      {
        match.namespace = "^quickshell.*$";
        blur_popups = true;
      }
      {
        match.namespace = toRegex ["quickshell:bar"];
        ignore_alpha = 0.1;
      }
      {
        match.namespace = toRegex no_anim;
        no_anim = true;
      }
    ];

    # window rules
    window_rule = [
      # telegram media viewer
      {
        match.title = "^(Media viewer)$";
        float = true;
      }

      # Bitwarden extension (Chromium)
      {
        match.class = "chrome-nngceckbapebfimnlniiiahkandclblb-Default";
        float = true;
      }

      # Bitwarden extension (Zen/Firefox, doesn't work)
      {
        match.title = "^(.*Bitwarden Password Manager.*)$";
        float = true;
      }

      # make Firefox/Zen PiP window float and sticky
      {
        match.title = "^(Picture-in-Picture)$";
        float = true;
      }
      {
        match.title = "^(Picture-in-Picture)$";
        pin = true;
      }

      # throw sharing indicators away
      {
        match.title = "^(Firefox — Sharing Indicator)$";
        workspace = "special:silent";
      }
      {
        match.title = "^(Zen — Sharing Indicator)$";
        workspace = "special:silent";
      }
      {
        match.title = "^(.*is sharing (your screen|a window)\\.)$";
        workspace = "special:silent";
      }

      # start Spotify and YouTube Music in ws9
      {
        match.title = "^(Spotify( Premium)?)$";
        workspace = "9 silent";
      }

      # idle inhibit while watching videos
      {
        match.class = "^(mpv|.+exe|celluloid)$";
        idle_inhibit = "focus";
      }
      {
        match.class = "^(zen)$";
        match.title = "^(.*YouTube.*)$";
        idle_inhibit = "focus";
      }
      {
        match.class = "^(zen)$";
        idle_inhibit = "fullscreen";
      }

      {
        match.class = "^(gcr-prompter)$";
        dim_around = true;
      }
      {
        match.class = "^(xdg-desktop-portal-gtk)$";
        dim_around = true;
      }
      {
        match.class = "^(polkit-gnome-authentication-agent-1)$";
        dim_around = true;
      }
      {
        match.class = "^(zen)$";
        match.title = "^(File Upload)$";
        dim_around = true;
      }

      # fix xwayland apps
      {
        match.xwayland = true;
        rounding = 0;
      }
      {
        match.class = "^(.*jetbrains.*)$";
        match.title = "^(Confirm Exit|Open Project|win424|win201|splash)$";
        center = true;
      }
      {
        match.class = "^(.*jetbrains.*)$";
        match.title = "^(splash)$";
        size = "640 400";
      }

      # less sensitive scroll for some windows
      # browser(-based)
      {
        match.class = "^(zen|firefox|chromium-browser|chrome-.*)$";
        scroll_touchpad = 0.1;
      }
      {
        match.class = "^(obsidian)$";
        scroll_touchpad = 0.1;
      }
      {
        match.class = "^(steam)$";
        scroll_touchpad = 0.1;
      }
      {
        match.class = "^(Zotero)$";
        scroll_touchpad = 0.1;
      }
      # GTK3
      {
        match.class = "^(com.github.xournalpp.xournalpp)$";
        scroll_touchpad = 0.1;
      }
      {
        match.class = "^(libreoffice.*)$";
        scroll_touchpad = 0.1;
      }
      {
        match.class = "^(.virt-manager-wrapped)$";
        scroll_touchpad = 0.1;
      }
      {
        match.class = "^(xdg-desktop-portal-gtk)$";
        scroll_touchpad = 0.1;
      }
      # Qt5
      {
        match.class = "^(org.prismlauncher.PrismLauncher)$";
        scroll_touchpad = 0.1;
      }
      {
        match.class = "^(org.kde.kdeconnect.app)$";
        scroll_touchpad = 0.1;
      }
      # Others
      {
        match.class = "^(org.pwmt.zathura)$";
        scroll_touchpad = 0.1;
      }

      # PoE
      {
        match.title = "(Awakened PoE Trade)";
        workspace = "unset";
        tag = "+apt";
      }
      {
        match.title = "(Awakened PoE Trade)";
        tag = "+media";
      }
      {
        match.tag = "apt";
        float = true;
      }
      {
        match.tag = "apt";
        no_blur = true;
      }

      # PoE2
      {
        match.title = "(Exiled Exchange 2)";
        workspace = "unset";
        tag = "+apt2";
      }
      {
        match.title = "(Exiled Exchange 2)";
        tag = "+media";
      }
      {
        match.tag = "apt2";
        float = true;
      }
      {
        match.tag = "apt2";
        no_blur = true;
      }

      # pavucontrol
      {
        match.class = "(pavucontrol)";
        float = true;
      }
      {
        match.title = "^(Volume Control)$";
        float = true;
      }
      {
        match.title = "^(Volume Control)$";
        size = "800 600";
      }
      {
        match.title = "^(Volume Control)$";
        move = "75 44%";
      }

      {
        match.class = "^(bitwarden)$";
        float = true;
      }
      {
        match.class = "^(imv)$";
        float = true;
      }
      {
        match.class = "^(vesktop)$";
        float = true;
      }
      {
        match.class = "^(org.qbittorrent.qBittorrent)$";
        float = true;
      }
      {
        match.class = "^(mpv)$";
        float = true;
      }
      {
        match.class = "^(Nextcloud)$";
        workspace = "10 silent";
      }

      # Signal
      {
        match.class = "^(signal)$";
        float = true;
      }
      {
        match.class = "^(signal)$";
        center = true;
      }
      {
        match.class = "^(signal)$";
        pin = true;
      }
    ];
  };
}
