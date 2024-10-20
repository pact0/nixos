{
  config,
  pkgs,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
  username = "pacto";
in {
  users = {
    groups = {
      media.name = "media";
      media.gid = 1001;
    };

    users.${username} = {
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
      # defaultUserShell = pkgs.fish;
    };
  };

  nix.settings.allowed-users = ["${username}"];
}
