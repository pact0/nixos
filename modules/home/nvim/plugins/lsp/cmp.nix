{...}: {
  programs.nixvim = {
    plugins = {
      cmp-emoji = {enable = true;};
      luasnip = {enable = true;};
      friendly-snippets = {enable = true;};
      # copilot-cmp.enable = true;

      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          experimental = {ghost_text = true;};
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };
          snippet = {expand = "luasnip";};
          formatting = {fields = ["kind" "abbr" "menu"];};
          sorting = {
            comparators = [
                "require('cmp.config.compare').offset"
                "require('cmp.config.compare').exact"
                "require('cmp.config.compare').score"
                "require('cmp.config.compare').recently_used"
                "require('cmp.config.compare').locality"
                "require('cmp.config.compare').kind"
                "require('cmp.config.compare').length"
                "require('cmp.config.compare').order"
            ];
          };

          window = {
            completion = {
              border = "rounded";
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
            };
            documentation = {border = "rounded";};
          };

          mapping = {
            "<Tab>" = "cmp.mapping(function(fallback)
            local luasnip = require(\"luasnip\")
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
            end, { \"i\", \"s\" })";
            "<S-Tab>" = "cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
            end, { \"i\", \"s\" })";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };

          sources = [
            {name = "nvim_lsp";}
            {name = "emoji";}
            {
              name = "buffer"; # text within current buffer
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
              keywordLength = 3;
            }
            {
              name = "path"; # file system paths
              keywordLength = 3;
            }
            {
              name = "luasnip"; # snippets
              keywordLength = 3;
            }
          ];

        # formatting = {
        #   format = "function(entry, vim_item)
        #     local lspkind_ok, lspkind = pcall(require, \"lspkind\")
        #     if not lspkind_ok then
        #       -- From kind_icons array
        #       vim_item.kind = string.format(\"%s %s\", kind_icons[vim_item.kind], vim_item.kind)
        #       -- Source
        #       vim_item.menu = ({
        #         copilot = \"[Copilot]\",
        #         nvim_lsp = \"[LSP]\",
        #         nvim_lua = \"[Lua]\",
        #         luasnip = \"[LuaSnip]\",
        #         buffer = \"[Buffer]\",
        #         latex_symbols = \"[LaTeX]\",
        #       })[entry.source.name]
        #       return vim_item
        #     else
        #       -- From lspkind
        #       return lspkind.cmp_format()(entry, vim_item)
        #     end
        #   end";
        # };

        };
      };
      cmp-nvim-lsp = {enable = true;}; # lsp
      cmp-buffer = {enable = true;};
      cmp-path = {enable = true;}; # file system paths
      cmp_luasnip = {enable = true;}; # snippets
      cmp-cmdline = {enable = false;}; # autocomplete for cmdline
    };

    extraConfigLua = ''
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      -- local lspkind = require("lspkind")

      local kind_icons = {
        Text = "",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰂡",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",
      }
      require("luasnip.loaders.from_vscode").lazy_load()
      luasnip.config.setup({})

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

      })

    '';
    # extraConfigLua = ''
    #         luasnip = require("luasnip")
    #         kind_icons = {
    #           Text = "󰊄",
    #           Method = "",
    #           Function = "󰡱",
    #           Constructor = "",
    #           Field = "",
    #           Variable = "󱀍",
    #           Class = "",
    #           Interface = "",
    #           Module = "󰕳",
    #           Property = "",
    #           Unit = "",
    #           Value = "",
    #           Enum = "",
    #           Keyword = "",
    #           Snippet = "",
    #           Color = "",
    #           File = "",
    #           Reference = "",
    #           Folder = "",
    #           EnumMember = "",
    #           Constant = "",
    #           Struct = "",
    #           Event = "",
    #           Operator = "",
    #           TypeParameter = "",
    #         }

    #          local cmp = require'cmp'

    #      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    #      cmp.setup.cmdline({'/', "?" }, {
    #        sources = {
    #          { name = 'buffer' }
    #        }
    #      })

    #     -- Set configuration for specific filetype.
    #      cmp.setup.filetype('gitcommit', {
    #        sources = cmp.config.sources({
    #          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    #        }, {
    #          { name = 'buffer' },
    #        })
    #      })

    #      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    #      cmp.setup.cmdline(':', {
    #        sources = cmp.config.sources({
    #          { name = 'path' }
    #        }, {
    #          { name = 'cmdline' }
    #        }),
    #   --      formatting = {
    #   --       format = function(_, vim_item)
    #   --         vim_item.kind = cmdIcons[vim_item.kind] or "FOO"
    #   --       return vim_item
    #   --      end
    #   -- }
    #      })

    # '';
  };
}
