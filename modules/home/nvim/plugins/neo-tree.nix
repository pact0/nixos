{
  pkgs,
  config,
  inputs,
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
    plugins.neo-tree = {
      enable = true;

      enableDiagnostics = true;
      enableGitStatus = true;

      renderers.file = [
        "indent"
        "icon"
        {
          name = "container";
          content = [
            {
              name = "name";
              zindex = 10;
            }
            {
              name = "clipboard";
              zindex = 10;
            }
            {
              name = "bufnr";
              zindex = 10;
            }
            {
              name = "modified";
              zindex = 20;
              align = "right";
            }
            {
              name = "harpoon_index";
              zindex = 20;
              align = "right";
            }
            {
              name = "diagnostics";
              zindex = 20;
              align = "right";
            }
            {
              name = "git_status";
              zindex = 20;
              align = "right";
            }
          ];
        }
      ];

      extraOptions = {
        filesystem = {
          follow_current_file = {
            enabled = true;
            leave_dirs_open = false;
          };
          group_empty_dirs = false;
          hijack_netrw_behavior = "open_default";
          components = {
            harpoon_index.__raw = "
              function(config, node, _)
                            local Marked = require(\"harpoon.mark\")
                            local path = node:get_id()
                            local success, index = pcall(Marked.get_index_of, path)
                            if success and index and index > 0 then
                              return {
                                text = string.format(\"%d \", index), -- <-- Add your favorite harpoon like arrow here
                                highlight = config.highlight or \"NeoTreeDirectoryIcon\",
                              }
                            else
                              return {
                                text = \"  \",
                              }
                            end
                          end
            ";
          }; # components
        }; # filesystem
      }; # extraoptions
    }; # neo-tree
    keymaps = [
      {
        mode = "n";
        key = "<leader><tab>";
        action = "<cmd>Neotree toggle float<CR>";
        options = {
          desc = "Float File Explorer";
        };
      }

      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle left<CR>";
        options = {
          desc = "Left File Explorer";
        };
      }
    ];

    # extraConfigLua = ''
    # '';
  };
}
