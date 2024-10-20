{
  pkgs,
  inputs,
  username,
  theme,
  config,
  stylix,
  colors,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs username stylix pkgs theme colors;};
    users.${username} = {
      imports = [(import ./../home)];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  programs.fish.enable = true;
  programs.zsh.enable = true;

  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";
  environment.variables.BROWSER = "firefox";
  environment.variables.READER = "zathura";
  environment.variables.TERMINAL = "kitty";
  environment.variables.FILE = "nnn";
  environment.variables.PAGER = "bat";
}
