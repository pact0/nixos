{inputs, pkgs, ...}: {

  # programs.nixvim.enable = true;
  # home.packages = [ inputs.nixvim.packages.${pkgs.system}.default ];
  # imports = [
  #   (import ./options.nix)
  #   (import ./keymaps.nix)
  #   (import ./plugins)
  # ];
  #
  # programs.nixvim = {
  #   enable = true;
  #   viAlias = true;
  #   vimAlias = true;
  #   defaultEditor = true;
  #
  #   clipboard.register = "unnamedplus";
  #   clipboard.providers.wl-copy.enable = true;
  #
  #   globals.mapleader = " ";
  #
  #   plugins.which-key = {
  #     enable = true;
  #     registrations = {
  #       "<leader>h" = "Harpoon";
  #       "<leader>c" = "Code Actions";
  #       "<leader>g" = "Git";
  #     };
  #   };
  #
  #   plugins.hardtime = {
  #     enable = false;
  #     # settings = {
  #     #   duration = 100;
  #     # };
  #   };
  #
  #
  #   extraPlugins = [ 
  #   pkgs.vimPlugins.nvim-spectre 
  #   pkgs.vimPlugins.nvim-surround 
  #   ];
  #   extraConfigLua = ''
  #     require("nvim-surround").setup({
  #           -- Configuration here, or leave empty to use defaults
  #       })
  #   '';
  #
  #
  #   plugins.transparent = {
  #     enable = true;
  #     settings = {
  #       exclude_groups = [];
  #       extra_groups = [
  #         "NormalFloat"
  #         "NvimTreeNormal"
  #         "NeoTree"
  #         "BufferLine"
  #         "lualine"
  #         "Telescope"
  #         "TelescopeNormal"
  #         "TelescopeBorder"
  #         "TelescopePromptBorder"
  #         "LspFloatWinNormal"
  #         "IndentBlanklineChar"
  #         "Normal"
  #         "toggleterm"
  #         "TreesitterContext"
  #       ];
  #     };
  #   };
  # };
}
