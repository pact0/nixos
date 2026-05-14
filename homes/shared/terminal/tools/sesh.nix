{
  programs.sesh = {
    enable = true;
    enableAlias = true;
    enableTmuxIntegration = true;
    tmuxKey = "s";

    settings = {
      session = [
        {
          name = "NixOS 📥";
          path = "~/nixos";
          startup_command = "ls";
        }

        {
          name = "Neovim 📥";
          path = "~/nvf";
          startup_command = "ls";
        }
      ];
    };
  };
}
