{
  lib,
  pkgs,
  config,
  osConfig,
  ...
}: let
  inherit (lib.modules) mkForce;
  cfg = osConfig.modules.system.impermanence;

  pluginNames = ["grc" "z" "fzf-fish" "done" "forgit" "autopair" "bass"];

  mkPlugin = name: {
    inherit name;
    src = pkgs.fishPlugins.${name}.src;
  };

  plugins = map mkPlugin pluginNames;
in {
  config = {
    home.packages = with pkgs; [grc];

    programs = {
      fish = {
        enable = true;

        interactiveShellInit = ''
          set fish_greeting # Disable greeting
          fish_vi_key_bindings
        '';

        shellAliases = {
          build = mkForce "nixbuild";
        };

        functions = {
          nixbuild = ''
            nix build $argv --builders ""
          '';
        };

        plugins = plugins;
      };

      autojump.enableFishIntegration = true;
      fzf.enableFishIntegration = true;
      yazi.enableFishIntegration = true;
      eza.enableFishIntegration = true;
    };
  };
  # // lib.optionalAttrs (cfg.home.enable && config.programs.fish.enable) {
  #   # home.persistence."/persist".directories = [
  #   #   ".local/share/fish"
  #   # ];
  # };
}
