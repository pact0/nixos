{pkgs, ...}: {
  imports = [
    (import ./treesitter-textobjects.nix)
  ];

  programs.nixvim = {
    plugins.ts-autotag.enable = true;
    plugins.treesitter-context = {
      enable = true;
    };

    plugins.treesitter-refactor = {
      enable = true;
    };

    plugins.treesitter = {
      enable = true;
      indent = true;
      folding = false;
      nixvimInjections = true;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;
    };
    filetype = {
      extension = {
      };
    };
    extraConfigLua = ''
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    '';
  };
}
