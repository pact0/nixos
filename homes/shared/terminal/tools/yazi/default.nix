{
  inputs',
  lib,
  pkgs,
  ...
}: let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "eaf6920b7439fa7164a1c162a249c3c76dc0acd9";
    hash = "sha256-B6zhZfp3SEaiviIzosI2aD8fk+hQF0epOTKi1qm8V3E=";
  };
in {
  home.packages = with pkgs; [
    exiftool
    ripdrag
  ];

  programs.yazi = {
    enable = true;

    package = inputs'.yazi.packages.default.override {
      _7zz = pkgs._7zz-rar;
    };
    enableZshIntegration = true;
    shellWrapperName = "y";

    settings = {
      mgr = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };

    plugins = {
      inherit (pkgs.yaziPlugins) git mount chmod full-border drag mediainfo starship rich-preview glow;

      toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
    };

    initLua = ''
      require("full-border"):setup()
      require("starship"):setup()
    '';

    keymap = {
      mgr.prepend_keymap = [
        {
          on = "T";
          run = "plugin toggle-pane max-preview";
          desc = "Maximize or restore the preview pane";
        }
        {
          on = ["c" "m"];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }

        # Run ripdrag when pressing C-n
        {
          on = ["<C-n>"];
          run = "plugin drag";
          desc = "Drag Files";
        }
      ];
    };
    keymap.manager.prepend_keymap = [
      {
        on = ["<C-n>"];
        run = "plugin drag";
        desc = "Drag Files";
      }
    ];
  };
}
