{
  pkgs,
  inputs,
  ...
}: {
  programs.nixvim = {
    keymaps = [
      # Harpoon
      {
        key = "<leader>ha";
        action = "<cmd>lua require('harpoon.mark').add_file()<cr>";
        mode = "n";
        options = {
          desc = "Harpoon add";
        };
      }

      {
        key = "<leader>hm";
        action = "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>";
        mode = "n";
        options = {
          desc = "Harpoon menu";
        };
      }
      {
        key = "]h";
        action = "<cmd>lua require('harpoon.ui').nav_next()<cr>";
        mode = "n";
        options = {
          desc = "Harpoon next file";
        };
      }
      {
        key = "[h";
        action = "<cmd>lua require('harpoon.ui').nav_prev()<cr>";
        mode = "n";
        options = {
          desc = "Harpoon previous file";
        };
      }
      {
        key = "<C-e>";
        action = "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>";
        mode = "n";
        options = {
          desc = "Harpoon open menu";
        };
      }
      {
        key = "<Esc>";
        action = "<Esc><cmd>noh<CR>";
        mode = "n";
        options = {
          desc = "Clear HL";
        };
      }

      {
        key = "<C-d>";
        action = "<C-d>zz";
        mode = "n";
        options = {
          desc = "C-d center";
        };
      }

      {
        key = "<C-u>";
        action = "<C-u>zz";
        mode = "n";
        options = {
          desc = "C-u center";
        };
      }
      {
        key = "J";
        action = "<cmd>m '>+1<CR>gv=gv";
        mode = "v";
        options = {
          desc = "Move selected line / block of text in visual mode";
        };
      }
      {
        key = "K";
        action = "<cmd>m '<-2<CR>gv=gv";
        mode = "v";
        options = {
          desc = "Move selected line / block of text in visual mode";
        };
      }

      {
        key = "<";
        action = "<gv";
        mode = "v";
        options = {
          desc = "indenting";
        };
      }
      {
        key = ">";
        action = ">gv";
        mode = "v";
        options = {
          desc = "indenting";
        };
      }

      # {
      #   key = "p";
      #   action = "\"_dp";
      #   mode = "v";
      #   options = {
      #     desc = "paste over currently selected text without yanking it";
      #   };
      # }
      # {
      #   key = "P";
      #   action = "\"_dP";
      #   mode = "v";
      #   options = {
      #     desc = "paste over currently selected text without yanking it";
      #   };
      # }

      {
        key = "j";
        action = "gj";
        mode = "n";
        options = {
          desc = "Move line on the screen rather than by line in the file";
        };
      }
      {
        key = "k";
        action = "gk";
        mode = "n";
        options = {
          desc = "Move line on the screen rather than by line in the file";
        };
      }

      {
        key = "+";
        action = "<cmd>vertical resize +5<CR>";
        mode = "n";
        options = {
          desc = "Vertival resize";
        };
      }
      {
        key = "_";
        action = "<cmd>vertical resize -5<CR>";
        mode = "n";
        options = {
          desc = "Vertival resize";
        };
      }

      {
        key = "=";
        action = "<cmd>resize +5<CR>";
        mode = "n";
        options = {
          desc = "Horizontal resize";
        };
      }
      {
        key = "-";
        action = "<cmd>resize -5<CR>";
        mode = "n";
        options = {
          desc = "Horizontal resize";
        };
      }

      {
        key = "<leader>qs";
        action = "<cmd>lua require(\"persistence\").load()<cr>";
        mode = "n";
        options = {
          desc = "restore the session for the current directory";
        };
      }
      {
        key = "<leader>ql";
        action = "<cmd>lua require(\"persistence\").load({ last = true })<cr>";
        mode = "n";
        options = {
          desc = "restore the last session";
        };
      }
      {
        key = "<leader>U";
        action = "<cmd>UndotreeToggle<cr>";
        mode = "n";
        options = {
          desc = "toggle undotree";
        };
      }

     {
        mode = "n";
        key = "[b";
        action = "<cmd>bp<CR>";
        options = {
          desc = "Previouv Buffer";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "]b";
        action = "<cmd>bn<CR>";
        options = {
          desc = "Next Buffer";
          silent = true;
        };
      }
    ];
  };
}
