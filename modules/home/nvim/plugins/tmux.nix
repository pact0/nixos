{
  pkgs,
  inputs,
  ...
}: {
  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>TmuxNavigateLeft<cr>";
        key = "<A-h>";
        mode = ["n" "t"];
      }
      {
        action = "<cmd>TmuxNavigateDown<cr>";
        key = "<A-j>";
        mode = ["n" "t"];
      }
      {
        action = "<cmd>TmuxNavigateUp<cr>";
        key = "<A-k>";
        mode = ["n" "t"];
      }
      {
        action = "<cmd>TmuxNavigateRight<cr>";
        key = "<A-l>";
        mode = ["n" "t"];
      }
    ];

    plugins.tmux-navigator = {
      enable = true;
    };
  };
}
