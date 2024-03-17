{
  pkgs,
  inputs,
  ...
}: {
  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>lua require(\"flash\").jump()<cr>";
        key = "s";
      }
      {
        action = "<cmd>lua require(\"flash\").treesitter()<cr>";
        key = "S";
      }
    ];

    plugins.flash = {
      enable = true;
      label.rainbow.enabled = true;
    };
  };
}
