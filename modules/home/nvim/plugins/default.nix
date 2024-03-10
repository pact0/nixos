{...}: {
  imports = [
    (import ./tmux.nix)
    (import ./telescope.nix)
    (import ./neo-tree.nix)
    (import ./extra.nix)

    (import ./lsp)
    (import ./ui)
    (import ./git)
    (import ./treesitter)
  ];
}
