{ pkgs, inputs, username, config, stylix, ...}:
let
  packages = with pkgs; [
    fish
    neovim-nightly
  ];
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  nixpkgs = {
    overlays =  [
      inputs.neovim-nightly-overlay.overlay
    ];
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username stylix pkgs; };
    users.${username} = {
      imports = [ (import ./../home) ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "23.11";
      programs.home-manager.enable = true;
    };

  };

  programs.fish.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    #initialPassword = "test";
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" ]
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
    ];
    shell = pkgs.fish;
  };
  nix.settings.allowed-users = [ "${username}" ];
}