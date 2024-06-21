{...}: {
  programs.nixvim = {
    plugins.neotest = {
      enable = true;

      adapters = {

        vitest = {
          enable = true;
          settings = {
            callback = {
              __raw = ''
                function()

                  filter_dir = function(name, rel_path, root)
                    return name ~= "node_modules"
                  end

                end
              '';
          };
          };
        };

      };
    };

    keymaps = [
      {
        mode = ["n" "t"];
        key = "<leader>twr";
        action = "<cmd>lua require('neotest').run.run({ vitestCommand = 'npx vitest -w' })<cr>";
        options = {
          desc = "Run Watch";
        };
      }

      {
        mode = ["n" "t"];
        key = "<leader>twf";
        action = "<cmd>lua require('neotest').run.run({ vim.fn.expand(\"%\"), vitestCommand = 'npx vitest -w' })<cr>";
        options = {
          desc = "Run Watch File";
        };
      }

      {
        mode = ["n" "t"];
        key = "<leader>tws";
        action = "<cmd>Neotest summary<cr>";
        options = {
          desc = "Test Summary";
        };
      }

      {
        mode = ["n" "t"];
        key = "<leader>two";
        action = "<cmd>Neotest output<cr>";
        options = {
          desc = "Test Summary";
        };
      }

    ];

  };
}




