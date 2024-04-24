{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    (import ./bar.nix)
  ];
  programs.nixvim = {



    plugins.noice = {
      enable = false;
      notify = {
        enabled = false;
      };
      messages = {
        enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason
      };
      lsp = {
        message = {
          enabled = true;
        };
        progress = {
          enabled = false;
          view = "mini";
        };
      };
      popupmenu = {
        enabled = true;
        backend = "nui";
      };
      format = {
        filter = {
          pattern = [":%s*%%s*s:%s*" ":%s*%%s*s!%s*" ":%s*%%s*s/%s*" "%s*s:%s*" ":%s*s!%s*" ":%s*s/%s*"];
          icon = "";
          lang = "regex";
        };
        replace = {
          pattern = [":%s*%%s*s:%w*:%s*" ":%s*%%s*s!%w*!%s*" ":%s*%%s*s/%w*/%s*" "%s*s:%w*:%s*" ":%s*s!%w*!%s*" ":%s*s/%w*/%s*"];
          icon = "󱞪";
          lang = "regex";
        };
      };
    };

    plugins.notify = {
      enable = false;
      #   backgroundColour = "#000000";
      fps = 60;
      render = "default";
      timeout = 1000;
      topDown = true;
    };

    plugins.nvim-ufo = {
      enable = true;
      enableGetFoldVirtText = true;
    };

    # extraConfigLua = ''
    #   local notify = require("notify")

    #   local filtered_message = { "No information available" }

    #   -- Override notify function to filter out messages
    #   ---@diagnostic disable-next-line: duplicate-set-field
    #   vim.notify = function(message, level, opts)
    #   	local merged_opts = vim.tbl_extend("force", {
    #   		on_open = function(win)
    #   			local buf = vim.api.nvim_win_get_buf(win)
    #   			vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
    #   		end,
    #   	}, opts or {})

    #   	for _, msg in ipairs(filtered_message) do
    #   		if message == msg then
    #   			return
    #   		end
    #   	end
    #   	return notify(message, level, merged_opts)
    #   end
    # '';
  };
}
