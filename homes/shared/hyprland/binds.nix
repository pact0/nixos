{pkgs, ...}: {
  home.packages = [
    pkgs.hyprsunset
    pkgs.hyprwayland-scanner
    pkgs.grimblast
    pkgs.hyprpicker
    # dbus-hyprland-env
  ];
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
        "$mod,Q,killactive," # kill focused window

        "$mod, F, exec, firefox"
        "$mod, RETURN, exec, kitty"

        # screenshot and receording binds
        "$mod, Print, exec, hyprshot" # copy all active outputs
        "$ALTSHIFT, S, exec, grimblast --notify --cursor copysave screen" # copy active screen
        ", Print, exec, grimblast --notify copysave area" # copy selection area

        # fullscreen
        "SUPER,Z,exec,hyprctl dispatch fullscreen 1"
        "SUPERSHIFT,Z,exec,hyprctl dispatch fullscreen 2"

        "$mod, d, exec, vicinae toggle"

        "$mod Shift, Escape, exec, dms ipc call powermenu open"
        "$mod Shift, L, exec, dms ipc call lock lock"
        "$mod,S,submap,resize"
        "$mod Shift,M,submap,media"
        "$mod Shift,S,submap,move"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (
            i: let
              ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"

              # "$mod, code:1${toString i}, split-workspace, ${toString ws}"
              # "$mod SHIFT, code:1${toString i}, split-movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );

    bindm = [
      "$mod,mouse:272,movewindow"
      "$mod,mouse:273,resizewindow"
    ];
  };

  wayland.windowManager.hyprland.submaps = {
    resize = {
      settings = {
        binde = [
          ", h, resizeactive, -10 0"
          ", j, resizeactive, 0 10"
          ", k, resizeactive, 0 -10"
          ", l, resizeactive, 10 0"
        ];

        bind = [
          ", escape, submap, reset"
        ];
      };
    };

    move = {
      settings = {
        binde = [
          ", h, movefocus, l"
          ", j, movefocus, d"
          ", k, movefocus, u"
          ", l, movefocus, r"

          "Shift, h, movewindow, l"
          "Shift, j, movewindow, d"
          "Shift, k, movewindow, u"
          "Shift, l, movewindow, r"
        ];

        bind = [
          ", escape, submap, reset"
        ];
      };
    };

    media = {
      settings = {
        binde = [
          ", h, exec, playerctl previous"
          ", j, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
          ", k, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
          ", l, exec, playerctl next"
          ", p, exec, playerctl play-pause"
        ];

        bind = [
          ", escape, submap, reset"
        ];
      };
    };
  };
}
