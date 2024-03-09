{
  description = "Nix Config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Gaming
    nix-gaming.url = "github:fufexan/nix-gaming";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # TODO: Add any other flake you might need
    #hardware.url = "github:nixos/nixos-hardware";

    # Theme
    nix-colors.url = "github:misterio77/nix-colors";
    stylix.url = "github:danth/stylix";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";


    # DE
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpicker.url = "github:hyprwm/hyprpicker";
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprlock.url = "github:hyprwm/hyprlock";
    hypridle.url = "github:hyprwm/hypridle";
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";

    # Firefox
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = {
    self,
    nixpkgs,
    stylix,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
    username = "pacto";
    theme = "gruvbox";
    selfPkgs = import ./pkgs;
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    #overlays = import ./overlays {inherit inputs selfPkgs;};



    nixosConfigurations = import ./modules/core/default.nix {
        inherit self nixpkgs inputs username outputs stylix ;
      };
  };
}
