{...}: {
  imports = [
    (import ./tmux.nix)
    (import ./telescope.nix)
    (import ./neo-tree.nix)
    (import ./toggleterm.nix)
    (import ./flash.nix)
    (import ./extra.nix)

    (import ./runner)
    (import ./lsp)
    (import ./tests)
    (import ./ui)
    (import ./git)
    (import ./treesitter)
  ];
}
