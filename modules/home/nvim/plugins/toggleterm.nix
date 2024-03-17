{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs.vimPlugins; [
    telescope-zoxide
  ];

  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
      persistMode = true;
    };

    keymaps = [
      #   {
      #     mode = "n";
      #     key = "<C-/>";
      #     action = "<cmd>ToggleTerm size=40 direction=horizontal name=main<cr>";
      #     options = {
      #       desc = "Main Runner Term";
      #     };
      #   }

      {
        mode = "n";
        key = "<C-b>";
        action = "<Cmd>exe v:count1 . \"ToggleTerm\"<CR>";
        options = {
          desc = "Floating Term";
        };
      }
    ];
  };
}
