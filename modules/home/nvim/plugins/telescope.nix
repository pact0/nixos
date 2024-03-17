{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs.vimPlugins; [
    telescope-zoxide
  ];

  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
        ui-select = {
          enable = true;
        };
        frecency = {
          enable = true;
        };
        media_files = {
          enable = true;
        };
        undo = {
          enable = true;
        };
      };
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
        };
        sorting_strategy = "ascending";
      };
      keymaps = {
        "<leader><space>" = {
          action = "find_files, {}";
          desc = "Find project files";
        };
        "<leader>/" = {
          action = "live_grep";
          desc = "Grep (root dir)";
        };
        "<leader>:" = {
          action = "command_history, {}";
          desc = "Command History";
        };
        ";" = {
          action = "resume";
          desc = "Resume";
        };
        "<leader>b" = {
          action = "buffers, {}";
          desc = "+buffer";
        };
        "<leader>ff" = {
          action = "find_files, {}";
          desc = "Find project files";
        };
        "<leader>fr" = {
          action = "live_grep, {}";
          desc = "Find text";
        };
        "<leader>fR" = {
          action = "resume, {}";
          desc = "Resume";
        };
        "<leader>fg" = {
          action = "oldfiles, {}";
          desc = "Recent";
        };
        "<leader>fb" = {
          action = "buffers, {}";
          desc = "Buffers";
        };
        "<C-p>" = {
          action = "git_files, {}";
          desc = "Search git files";
        };
        "<leader>gc" = {
          action = "git_commits, {}";
          desc = "Commits";
        };
        "<leader>gs" = {
          action = "git_status, {}";
          desc = "Status";
        };
        "<leader>sa" = {
          action = "autocommands, {}";
          desc = "Auto Commands";
        };
        "<leader>sb" = {
          action = "current_buffer_fuzzy_find, {}";
          desc = "Buffer";
        };
        "<leader>sc" = {
          action = "command_history, {}";
          desc = "Command History";
        };
        "<leader>sC" = {
          action = "commands, {}";
          desc = "Commands";
        };
        "<leader>sD" = {
          action = "diagnostics, {}";
          desc = "Workspace diagnostics";
        };
        "<leader>sh" = {
          action = "help_tags, {}";
          desc = "Help pages";
        };
        "<leader>sH" = {
          action = "highlights, {}";
          desc = "Search Highlight Groups";
        };
        "<leader>sk" = {
          action = "keymaps, {}";
          desc = "Keymaps";
        };
        "<leader>sM" = {
          action = "man_pages, {}";
          desc = "Man pages";
        };
        "<leader>sm" = {
          action = "marks, {}";
          desc = "Jump to Mark";
        };
        "<leader>so" = {
          action = "vim_options, {}";
          desc = "Options";
        };
        "<leader>sR" = {
          action = "resume, {}";
          desc = "Resume";
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>sd";
        action = "<cmd>Telescope diagnostics bufnr=0<cr>";
        options = {
          desc = "Document diagnostics";
        };
      }

      {
        mode = "n";
        key = "<leader>fz";
        action = "<cmd>Telescope zoxide list<CR>";
        options = {
          desc = "LazyGit (root dir)";
        };
      }
    ];

    extraConfigLua = ''
      local telescope = require("telescope")
            local actions = require("telescope.actions")
            local trouble = require("trouble.providers.telescope")

            vim.api.nvim_create_autocmd("FileType", {
              pattern = "TelescopeResults",
              callback = function(ctx)
                vim.api.nvim_buf_call(ctx.buf, function()
                  vim.fn.matchadd("TelescopeParent", "\t\t.*$")
                  vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
                end)
              end,
            })

            local function formattedName(_, path)
              local tail = vim.fs.basename(path)
              local parent = vim.fs.dirname(path)
              if parent == "." then
                return tail
              end
              return string.format("%s\t\t%s", tail, parent)
            end

            telescope.setup({
              file_ignore_patterns = { "%.git/." },
              -- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
              defaults = {
                mappings = {
                  i = {
                    ["<esc>"] = actions.close,
                    ["<C-t>"] = trouble.open_with_trouble,
                    ["<c-f>"] = actions.to_fuzzy_refine,
                  },

                  n = { ["<C-t>"] = trouble.open_with_trouble },
                },
                previewer = false,
                file_ignore_patterns = { "node_modules", "package-lock.json" },
                initial_mode = "insert",
                select_strategy = "reset",
                sorting_strategy = "ascending",
                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                layout_config = {
                  prompt_position = "top",
                  preview_cutoff = 120,
                },
                vimgrep_arguments = {
                  "rg",
                  "--color=never",
                  "--no-heading",
                  "--with-filename",
                  "--line-number",
                  "--column",
                  "--smart-case",
                  "--hidden",
                  "--glob=!.git/",
                },
              },
              pickers = {
                find_files = {
                  previewer = false,
                  path_display = formattedName,
                  layout_config = {
                    height = 0.4,
                    prompt_position = "top",
                    preview_cutoff = 120,
                  },
                },
                git_files = {
                  previewer = false,
                  path_display = formattedName,
                  layout_config = {
                    height = 0.4,
                    prompt_position = "top",
                    preview_cutoff = 120,
                  },
                  mappings = {
                    i = { ["<c-f>"] = actions.to_fuzzy_refine },
                  },
                },
                buffers = {
                  path_display = formattedName,
                  mappings = {
                    i = {
                      ["<c-d>"] = actions.delete_buffer,
                    },
                    n = {
                      ["<c-d>"] = actions.delete_buffer,
                    },
                  },
                  previewer = false,
                  initial_mode = "normal",
                  -- theme = "dropdown",
                  layout_config = {
                    height = 0.4,
                    width = 0.6,
                    prompt_position = "top",
                    preview_cutoff = 120,
                  },
                },
                current_buffer_fuzzy_find = {
                  previewer = true,
                  layout_config = {
                    prompt_position = "top",
                    preview_cutoff = 120,
                  },
                },
                live_grep = {
                  only_sort_text = true,
                  previewer = true,
                },
                grep_string = {
                  only_sort_text = true,
                  previewer = true,
                },
                lsp_references = {
                  show_line = false,
                  previewer = true,
                },
                treesitter = {
                  show_line = false,
                  previewer = true,
                },
                colorscheme = {
                  enable_preview = true,
                },
              },
              extensions = {
                fzf = {
                  fuzzy = true, -- false will only do exact matching
                  override_generic_sorter = true, -- override the generic sorter
                  override_file_sorter = true, -- override the file sorter
                  case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                },
                ["ui-select"] = {
                  require("telescope.themes").get_dropdown({
                    previewer = false,
                    initial_mode = "normal",
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    layout_config = {
                      horizontal = {
                        width = 0.5,
                        height = 0.4,
                        preview_width = 0.6,
                      },
                    },
                  }),
                },
                frecency = {
                  default_workspace = "CWD",
                  show_scores = true,
                  show_unindexed = true,
                  disable_devicons = false,
                  ignore_patterns = {
                    "*.git/*",
                    "*/tmp/*",
                    "*/lua-language-server/*",
                  },
                },
              },
            })
            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")
            telescope.load_extension("undo")
            telescope.load_extension("media_files")
            telescope.load_extension("frecency")
            telescope.load_extension("zoxide")
    '';
  };
}
