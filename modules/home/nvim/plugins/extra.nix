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
in {
  programs.nixvim = {
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
      trouble = {
        enable = true;
      };
      todo-comments = {
        enable = true;
      };
      rainbow-delimiters = {
        enable = true;
      };

      nvim-colorizer.enable = true;

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
    };

    plugins.indent-blankline = {
      enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = comment-nvim;
        config = "lua require(\"Comment\").setup()";
      }
    ];

    extraConfigLua = ''
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }

      require("ibl").setup()

      local indent_blankline_augroup = vim.api.nvim_create_augroup("indent_blankline_augroup", { clear = true })
      vim.api.nvim_create_autocmd("ModeChanged", {
        group = indent_blankline_augroup,
        pattern = "[vV\x16]*:*",
        command = "IBLEnable",
        desc = "Enable indent-blankline when exiting visual mode",
      })

      vim.api.nvim_create_autocmd("ModeChanged", {
        group = indent_blankline_augroup,
        pattern = "*:[vV\x16]*",
        command = "IBLDisable",
        desc = "Disable indent-blankline when exiting visual mode",
      })

      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }
      local hooks = require("ibl.hooks")

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#${colors.base08}" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#${colors.base09}" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#${colors.base0A}" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#${colors.base0B}" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#${colors.base0C}" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#${colors.base0D}" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#${colors.base0E}" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }

      require("ibl").setup({
        scope = {
          highlight = highlight,
          show_start = true,
        },
        indent = {
          char = "┊",
        },
        exclude =  {
          filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
          --buftypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
        },
        whitespace = {
          remove_blankline_trail = false,
        },
      })

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)


    '';
  };
}
