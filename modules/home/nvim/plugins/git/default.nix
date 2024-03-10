{...}: {
  imports = [
    (import ./gitsigns.nix)
  ];

  programs.nixvim = {
    plugins.neogit.enable = true;

    plugins.git-worktree = {
      enable = true;
      enableTelescope = true;
    };

    plugins.diffview.enable = true;
  };
}
