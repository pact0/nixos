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
      }
      {
        action = "<cmd>TmuxNavigateDown<cr>";
        key = "<A-j>";
      }
      {
        action = "<cmd>TmuxNavigateUp<cr>";
        key = "<A-k>";
      }
      {
        action = "<cmd>TmuxNavigateRight<cr>";
        key = "<A-l>";
      }
    ];

    plugins.tmux-navigator = {
      enable = true;
    };
  };
}
