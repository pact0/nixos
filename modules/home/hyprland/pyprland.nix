{pkgs, ...}: {
  home.packages = with pkgs; [
    pyprland
  ];

  home.file.".config/hypr/pyprland.json".text = ''
    {
      "pyprland": {
        "plugins": ["scratchpads", "magnify"]
      },
      "scratchpads": {
        "pavucontrol": {
          "command": "pavucontrol",
          "margin": 50,
          "unfocus": "hide",
          "animation": "fromBottom"
        }

      }
    }
  '';

  wayland.windowManager.hyprland = {
    settings = {
      "exec-once" = [
        "pypr"
      ];

      bind = [
        # Scratchpads
        # "SUPER,B,exec,pypr toggle && hyprctl dispatch bringactivetotop"
        "SUPER,T,exec,pypr toggle pavucontrol && hyprctl dispatch bringactivetotop"

        "SUPERALT,Z,exec,pypr zoom"
      ];
    };
    extraConfig = ''
      $scratchpadsize = size 80% 85%

      $scratchpad = class:^(scratchpad)$
      windowrulev2 = float,$scratchpad
      windowrulev2 = $scratchpadsize,$scratchpad
      windowrulev2 = workspace special silent,$scratchpad
      windowrulev2 = center,$scratchpad

      $pavucontrol = class:^(pavucontrol)$
      windowrulev2 = float,$pavucontrol
      windowrulev2 = size 86% 40%,$pavucontrol
      windowrulev2 = move 50% 6%,$pavucontrol
      windowrulev2 = workspace special silent,$pavucontrol
      windowrulev2 = opacity 0.80,$pavucontrol

    '';

    #   windowrulev2 = [
    #     "class:^(scratchpad)$"

    #     "float,$scratchpad"
    #     "size 80% 85%,$scratchpad"

    #     "workspace special silent,$scratchpad"
    #     "center,$scratchpad"
    #   ];
  };
}
