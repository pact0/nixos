{
  pkgs,
  inputs,
  ...
}: {
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
      persistMode = true;
      shadeTerminals = false;

      highlights = {
        # Normal = {
        #   guibg = "<VALUE-HERE>";
        # };
        # NormalFloat = {
        #   link = "Normal";
        # };
        # FloatBorder = {
        #   guifg = "<VALUE-HERE>";
        #   guibg = "<VALUE-HERE>";
        # };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<A-/>";
        action = "<cmd>ToggleTerm size=20 direction=horizontal name=main<cr>";
        options = {
          desc = "Main Runner Term";
        };
      }

      {
        mode = "n";
        key = "<C-t>";
        action = "<Cmd>exe v:count1 . \"ToggleTerm direction=float\"<CR>";
        options = {
          desc = "Floating Term";
        };
      }

      {
        mode = "t";
        key = "<ESC>";
        action = "<Cmd>ToggleTermToggleAll<CR>";
        options = {
          desc = "Toggle Off All Terminals";
        };
      }

      {
        mode = "t";
        key = "<A-h>";
        action = "<C-\\><C-N><C-W>h";
        options = {
          desc = "Move terminal";
        };
      }
      {
        mode = "t";
        key = "<A-j>";
        action = "<C-\\><C-n><C-W>j";
        options = {
          desc = "Move terminal";
        };
      }
      {
        mode = "t";
        key = "<A-k>";
        action = "<C-\\><C-n><C-W>k";
        options = {
          desc = "Move terminal";
        };
      }
      {
        mode = "t";
        key = "<A-l>";
        action = "<C-\\><C-n><C-W>l";
        options = {
          desc = "Move terminal";
        };
      }
    ];
  };
}
