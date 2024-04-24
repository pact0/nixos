{...}: {
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      globalstatus = true;
      disabledFiletypes = {
        statusline = ["dashboard" "alpha"];
      };
      #   componentSeparators = {
      #     left = "";
      #     right = " ";
      #   };
      #   sectionSeparators = {
      #     left = "";
      #     right = "";
      #   };
      sections = {
        lualine_a = [
          {
            name = "mode";
            icon = "";
            # separator = {
            #   left = "";
            #   right = "";
            # };
          }
        ];
        lualine_b = [
          {
            name = "branch";
            icon = "";
            # separator = {
            #   left = "";
            #   right = "";
            # };
            # color = {
            #   fg = "#1c1d21";
            #   bg = "#7d83ac";
            # };
          }

          # {
          #   name = "diff";
          # }
        ];
        lualine_c = [
          {
            name = "filetype";
            separator = {
              left = "";
              right = "";
            };
            extraConfig = {
              icon_only = true;
              padding = {
                left = 1;
                right = 0;
              };
            };
          }
          {
            name = "filename";
            extraConfig = {
              symbols = {
                modified = "  ";
                readonly = "";
                unnamed = "";
              };
            };
          }
          {
            name = "diagnostics";
            # extraConfig = {
            #   symbols = {
            #     error = " ";
            #     warn = " ";
            #     info = " ";
            #     hint = "󰝶 ";
            #   };
            # };
          }
        ];
        lualine_x = [
          "diff"
        ];
        lualine_y = [
          {
            name = "progress";
            icon = "";
            # color = {
            #   fg = "#1c1d21";
            #   bg = "#f2cdcd";
            # };
          }
        ];
        lualine_z = [
          {
            name = "location";
            # color = {
            #   fg = "#1c1d21";
            #   bg = "#f2cdcd";
            # };
          }
        ];
      };
    };
  };
}
