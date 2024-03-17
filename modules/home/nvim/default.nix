{inputs, ...}: {
  imports = [
    (import ./options.nix)
    (import ./keymaps.nix)
    (import ./plugins)
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    clipboard.register = "unnamedplus";
    clipboard.providers.wl-copy.enable = true;

    globals.mapleader = " ";

    plugins.which-key = {
      enable = true;
      registrations = {
        "<leader>h" = "Harpoon";
        "<leader>c" = "Code Actions";
        "<leader>g" = "Git";
      };
    };
  };
}
