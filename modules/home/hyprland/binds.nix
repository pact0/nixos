{pkgs, ...}: {
  home.packages = with pkgs; [
    hyprshot
    swappy
    cliphist
    hyprpicker

    (writeShellScriptBin "screenshot" ''
      hyprshot -m region -r | swappy -f -
    '')

    (writeShellScriptBin "pickColorAndSendNotif" ''
      hyprpicker -a && notify-send -u critical -t 4000 "$(wl-paste)"
    '')
  ];

  wayland.windowManager.hyprland = {
    settings = {
      bindm = [
        # Mouse binds
        "SUPER,mouse:272,movewindow"
        "SUPER,mouse:273,resizewindow"
      ];

      bind = [
        # Keyboard binds

        ## moving windows
        "SUPERSHIFT,left,movewindow,l"
        "SUPERSHIFT,right,movewindow,r"
        "SUPERSHIFT,up,movewindow,u"
        "SUPERSHIFT,down,movewindow,d"
        # vim-keybinds
        "SUPERSHIFT,h,movewindow,l"
        "SUPERSHIFT,l,movewindow,r"
        "SUPERSHIFT,k,movewindow,u"
        "SUPERSHIFT,j,movewindow,d"

        # switch workspace
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        # same as above, but switch to the workspace
        "SUPER SHIFT, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
        "SUPER SHIFT, 2, movetoworkspacesilent, 2"
        "SUPER SHIFT, 3, movetoworkspacesilent, 3"
        "SUPER SHIFT, 4, movetoworkspacesilent, 4"
        "SUPER SHIFT, 5, movetoworkspacesilent, 5"
        "SUPER SHIFT, 6, movetoworkspacesilent, 6"
        "SUPER SHIFT, 7, movetoworkspacesilent, 7"
        "SUPER SHIFT, 8, movetoworkspacesilent, 8"
        "SUPER SHIFT, 9, movetoworkspacesilent, 9"
        "SUPER SHIFT, 0, movetoworkspacesilent, 10"
        "SUPER CTRL, c, movetoworkspace, empty"

        # moving to other wokspace with mouse control
        "SUPER,mouse_down,workspace,e-1"
        "SUPER,mouse_up,workspace,e+1"

        "SUPER,Q,killactive,"
        "SUPERCTRL,M,exit,"
        "SUPER,space,togglefloating,"
        "SUPER,d,exec,wofi --show drun"
        #bind=SUPER,P,pseudo,

        # fullscreen
        "SUPER,Z,exec,hyprctl dispatch fullscreen 1"
        "SUPERSHIFT,Z,exec,hyprctl dispatch fullscreen 2"

        "SUPER,E,exec,thunar"
        "SUPER, Return, exec, kitty"

        "SUPER, P, pseudo,"
        "SUPER, J, togglesplit,"
        "SUPER,C,exec,pickColorAndSendNotif"

        # Screenshot
        ",Print,exec,hyprshot -m region --clipboard-only"
        "SHIFT,Print,exec,hyprshot -m region --output-folder ~/Pictures/screenshots/"
        "SUPER,Print,exec,screenshot"

        # clipboard
        "SUPER,V,exec,cliphist list | head -80 | cut -d' ' -f2- | wofi --show dmenu | wl-copy"
        "SUPER,W,exec,wallpaper-picker"

        # media and volume controls
        ",XF86AudioRaiseVolume,exec, pamixer -i 2"
        ",XF86AudioLowerVolume,exec, pamixer -d 2"
        ",XF86AudioMute,exec, pamixer -t"
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ", XF86AudioStop, exec, playerctl stop"
      ];
    };
  };
}
