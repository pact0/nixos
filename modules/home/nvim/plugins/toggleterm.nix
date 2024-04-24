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
    };

    keymaps = [
      {
        mode = ["n" "t"];
        key = "<A-/>";
        action = "<cmd>ToggleTerm size=20 direction=horizontal name=main<cr>";
        options = {
          desc = "Main Runner Term";
        };
      }

      # {
      #   mode = "n";
      #   key = "<C-t>";
      #   action = "<Cmd>exe v:count1 . \"ToggleTerm direction=float\"<CR>";
      #   options = {
      #     desc = "Floating Term";
      #   };
      # }

      # {
      #   mode = "t";
      #   key = "<ESC>";
      #   action = "<Cmd>ToggleTermToggleAll<CR>";
      #   options = {
      #     desc = "Toggle Off All Terminals";
      #   };
      # }
    ];
  };
}
