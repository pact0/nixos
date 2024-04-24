{...}: {
  programs.nixvim = {
    plugins.clangd-extensions = {
      enable = true;
      enableOffsetEncodingWorkaround = true;

    };

    keymaps = [
    {
      mode = "n";
      key = "<C-o>";
      command = "<cmd>ClangdSwitchSourceHeader<CR>";
      description = "Switch between source and header";
    }

    {
      mode = "n";
      key = "<leader>cca";
      command = "<cmd>ClangdAST<CR>";
      description = "Open AST view";
    }
    ];

    # extraConfigLua = ''
    #   require("clangd_extensions.inlay_hints").setup_autocmd()
    #   require("clangd_extensions.inlay_hints").set_inlay_hints()
    # '';
  };
}




