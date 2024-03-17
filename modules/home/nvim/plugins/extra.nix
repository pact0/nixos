{
  pkgs,
  config,
  stylix,
  ...
}: let
  colors = {
    base00 = "${config.lib.stylix.colors.base00}";
    base01 = "${config.lib.stylix.colors.base01}";
    base02 = "${config.lib.stylix.colors.base02}";
    base03 = "${config.lib.stylix.colors.base03}";
    base04 = "${config.lib.stylix.colors.base04}";
    base05 = "${config.lib.stylix.colors.base05}";
    base06 = "${config.lib.stylix.colors.base06}";
    base07 = "${config.lib.stylix.colors.base07}";
    base08 = "${config.lib.stylix.colors.base08}";
    base09 = "${config.lib.stylix.colors.base09}";
    base0A = "${config.lib.stylix.colors.base0A}";
    base0B = "${config.lib.stylix.colors.base0B}";
    base0C = "${config.lib.stylix.colors.base0C}";
    base0D = "${config.lib.stylix.colors.base0D}";
    base0E = "${config.lib.stylix.colors.base0E}";
    base0F = "${config.lib.stylix.colors.base0F}";
  };

  highlight = [
    "RainbowRed"
    "RainbowYellow"
    "RainbowBlue"
    "RainbowOrange"
    "RainbowGreen"
    "RainbowViolet"
    "RainbowCyan"
  ];
in {
  programs.nixvim = {
    highlight = {
      RainbowRed.fg = "#${colors.base08}";
      RainbowYellow.fg = "#${colors.base09}";
      RainbowBlue.fg = "#${colors.base0A}";
      RainbowOrange.fg = "#${colors.base0B}";
      RainbowGreen.fg = "#${colors.base0C}";
      RainbowViolet.fg = "#${colors.base0D}";
      RainbowCyan.fg = "#${colors.base0E}";
      TreesitterContextBottom.bg = "#${colors.base03}";
      NotifyBackground.bg = "#000000";
      # TreesitterContextSeparator.bg = "#${colors.base0F}";
      # TreesitterContextLineNumberBottom.fg = "";
    };

    plugins.multicursors.enable = false;

    plugins.illuminate = {
      enable = false;
      underCursor = true;
      filetypesDenylist = [
        "Outline"
        "TelescopePrompt"
        "alpha"
        "harpoon"
        "reason"
      ];
    };

    plugins = {
      image.enable = true;
      persistence.enable = true;

      trouble = {
        enable = true;
      };
      todo-comments = {
        enable = true;
      };
      rainbow-delimiters = {
        enable = true;
        highlight = highlight;
      };

      nvim-colorizer = {
        enable = true;
        userDefaultOptions = {
          css = true;
          css_fn = true;
          hsl_fn = true;
          rgb_fn = true;
          tailwind = true;
          names = true;
          mode = "background"; # virtualtext foreground background
        };
      };

      nvim-autopairs = {
        enable = true;
      };

      harpoon = {
        enable = true;
        enableTelescope = true;
        markBranch = true;
        keymapsSilent = true;
      };

      lazy = {
        enable = true;
      };
      comment-nvim = {
        enable = true;
        preHook = "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
      };
      indent-blankline = {
        enable = true;
        indent = {
          char = "┊";
        };
        whitespace = {
          removeBlanklineTrail = false;
        };
        scope = {
          enabled = true;
          showStart = false;
          showExactScope = false;
          highlight = highlight;
        };
        exclude = {
          buftypes = [
            "terminal"
            "nofile"
            "quickfix"
            "prompt"
          ];
          filetypes = [
            "lspinfo"
            "packer"
            "checkhealth"
            "help"
            "man"
            "gitcommit"
            "TelescopePrompt"
            "TelescopeResults"
            "\'\'"
            "help"
            "alpha"
            "dashboard"
            "neo-tree"
            "Trouble"
            "lazy"
          ];
        };
      };
    };
  };
}
