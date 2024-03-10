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
  packages = with pkgs; [
    fish
    neovim-nightly
  ];
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
      home.stateVersion = "23.11";
      programs.home-manager.enable = true;
    };
  };

  programs.fish.enable = true;
  programs.zsh.enable = true;

  users.groups.media = {
    name = "media";
    gid = 1001;
  };

  users.users.${username} = {
    isNormalUser = true;
    #initialPassword = "test";
    description = "${username}";
    extraGroups =
      ["networkmanager" "wheel" "media"]
      ++ ifTheyExist [
        "minecraft"
        "network"
        "wireshark"
        "i2c"
        "mysql"
        "docker"
        "podman"
        "git"
        "libvirtd"
        "deluge"
        "vboxsf"
        "video"
        "render"
      ];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = ["${username}"];

  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";
  environment.variables.BROWSER = "firefox";
  environment.variables.READER = "zathura";
  environment.variables.TERMINAL = "kitty";
  # environment.variables.FILE = "nnn";
  environment.variables.PAGER = "bat";

  environment.systemPackages = [
    pkgs.nodePackages.typescript
    # pkgs.nodePackages.typescript-styled-plugin
  ];
}
