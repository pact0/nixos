{pkgs, ...}: {
  users.users.pacto = {
    isNormalUser = true;
    description = "pacto";
    extraGroups = ["networkmanager" "wheel" "docker" "media"];
  };

  users.groups.media = {
    gid = 1001;
  };

  home-manager = {
    users = {
      pacto = {
        home = {
          username = "pacto";
          homeDirectory = "/home/pacto";
          stateVersion = "26.05";
        };

        programs = {
        };

        imports = [
          ../shared
        ];
      };
    };
  };
}
