{ username, ... }:
{
  environment = {
    persistence."/persist" = {
      directories = [
        "/etc/nixos"
      ];
      files = [
        "/etc/machine-id"
        "/etc/create_ap.conf"
      ];
      users.${username} = {
        directories = [
          "Downloads"
          "Music"
          "Pictures"
          "Documents"
          "Videos"
          ".cache"
          ".config"
          ".cabal"
          ".cargo"
          { directory = ".ssh"; mode = "0700"; }
          ".local"
          ".mozilla"
        ];
        files = [
          ".npmrc"
        ];
      };
    };
  };
}
