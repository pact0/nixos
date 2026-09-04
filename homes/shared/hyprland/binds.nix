{
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.hyprsunset
    pkgs.hyprwayland-scanner
    pkgs.grimblast
    pkgs.hyprpicker
    # dbus-hyprland-env
  ];

  wayland.windowManager.hyprland.settings = {
    mod = {
      _var = "SUPER";
    };

    bind =
      [
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + Q"'')
            (lib.generators.mkLuaInline "hl.dsp.window.close()")
          ];
        }

        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + F"'')
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"firefox\")")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + RETURN"'')
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"kitty\")")
          ];
        }

        # screenshot and recording binds
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + Print"'')
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot\")") # copy all active outputs
          ];
        }
        {
          _args = [
            "ALT + SHIFT + S"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"grimblast --notify --cursor copysave screen\")") # copy active screen
          ];
        }
        {
          _args = [
            "Print"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"grimblast --notify copysave area\")") # copy selection area
          ];
        }

        # fullscreen
        {
          _args = [
            "SUPER + SHIFT + Z"
            (lib.generators.mkLuaInline "hl.dsp.window.fullscreen({ mode = \"fullscreen\", action = \"toggle\" })")
          ];
        }
        {
          _args = [
            "SUPER + Z"
            (lib.generators.mkLuaInline "hl.dsp.window.fullscreen({ mode = \"maximized\", action = \"toggle\" })")
          ];
        }

        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + D"'')
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"vicinae toggle\")")
          ];
        }

        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + Escape"'')
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"dms ipc call powermenu open\")")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + L"'')
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"dms ipc call lock lock\")")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + S"'')
            (lib.generators.mkLuaInline "hl.dsp.submap(\"resize\")")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + M"'')
            (lib.generators.mkLuaInline "hl.dsp.submap(\"media\")")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + S"'')
            (lib.generators.mkLuaInline "hl.dsp.submap(\"move\")")
          ];
        }

        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + T"'')
            (lib.generators.mkLuaInline "hl.dsp.group.toggle()") # group focused window
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + G"'')
            (lib.generators.mkLuaInline "hl.dsp.group.next()") # switch within the active group
          ];
        }
      ]
      ++ (
        # workspaces
        # binds mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (
            i: let
              ws = i + 1;
            in [
              {
                _args = [
                  (lib.generators.mkLuaInline ''mod .. " + code:1${toString i}"'')
                  (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = ${toString ws} })")
                ];
              }
              {
                _args = [
                  (lib.generators.mkLuaInline ''mod .. " + SHIFT + code:1${toString i}"'')
                  (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = ${toString ws} })")
                ];
              }
            ]
          )
          9)
      )
      # mouse bindings
      ++ [
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + mouse:272"'')
            (lib.generators.mkLuaInline "hl.dsp.window.drag()")
            {mouse = true;}
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + mouse:273"'')
            (lib.generators.mkLuaInline "hl.dsp.window.resize()")
            {mouse = true;}
          ];
        }
      ];
  };

  wayland.windowManager.hyprland.submaps = {
    resize = {
      onDispatch = "reset";
      settings.bind = [
        {
          _args = [
            "h"
            (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = -10, y = 0, relative = true })")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "j"
            (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = 0, y = 10, relative = true })")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "k"
            (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = 0, y = -10, relative = true })")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "l"
            (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = 10, y = 0, relative = true })")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "escape"
            (lib.generators.mkLuaInline "hl.dsp.submap(\"reset\")")
          ];
        }
      ];
    };

    move = {
      onDispatch = "reset";
      settings.bind = [
        {
          _args = [
            "h"
            (lib.generators.mkLuaInline "hl.dsp.focus({ direction = \"l\" })")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "j"
            (lib.generators.mkLuaInline "hl.dsp.focus({ direction = \"d\" })")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "k"
            (lib.generators.mkLuaInline "hl.dsp.focus({ direction = \"u\" })")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "l"
            (lib.generators.mkLuaInline "hl.dsp.focus({ direction = \"r\" })")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "SHIFT + h"
            (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = \"l\" })")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "SHIFT + j"
            (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = \"d\" })")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "SHIFT + k"
            (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = \"u\" })")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "SHIFT + l"
            (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = \"r\" })")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "escape"
            (lib.generators.mkLuaInline "hl.dsp.submap(\"reset\")")
          ];
        }
      ];
    };

    media = {
      onDispatch = "reset";
      settings.bind = [
        {
          _args = [
            "h"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"playerctl previous\")")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "j"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-\")")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "k"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+\")")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "l"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"playerctl next\")")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "p"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"playerctl play-pause\")")
            {repeating = true;}
          ];
        }
        {
          _args = [
            "escape"
            (lib.generators.mkLuaInline "hl.dsp.submap(\"reset\")")
          ];
        }
      ];
    };
  };
}
