{inputs, ...}: {
  programs.mpv.bindings = {
    WHEEL_UP = "add volume 5";
    WHEEL_DOWN = "add volume -5";
    "Alt+0" = "set window-scale 0.5";
    s = "screenshot";

    RIGHT = "seek +10";
    LEFT = "seek -10";
    DOWN = "seek -60";
    UP = "seek +60";
    PGUP = "seek 600";
    PGDWN = "seek -600";

    w = "add panscan -0.1"; # zoom out with -panscan 0 -fs
    e = "add panscan +0.1"; #      in
  };
}
