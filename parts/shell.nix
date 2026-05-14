{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShellNoCC {
      name = "nyx";
      meta.description = ''
        The default development shell for my NixOS configuration
      '';

      # Set up pre-commit hooks when user enters the shell.
      shellHook = ''
        ${config.pre-commit.installationScript}
      '';

      # Tell Direnv to shut up.
      DIRENV_LOG_FORMAT = "";

      # Receive packages from treefmt's configured devShell.
      inputsFrom = [config.treefmt.build.devShell];
      packages = with pkgs;
        [
          fish
          jq
          fd
          nh
          cava
          bluez
          ddcutil
          brightnessctl
          curl
          material-symbols
        ]
        ++ [
          # Packages provided by flake inputs
          # inputs'.sops-nix.packages.default # sops CLI for secrets management
          # inputs'.deploy-rs.packages.default # deploy-rs CLI for easy deployments

          pkgs.sops

          # just for build aliases
          pkgs.just
          # Packages provided by flake-parts modules
          config.treefmt.build.wrapper # Quick formatting tree-wide with `treefmt`

          # Packages from nixpkgs, for Nix, Flakes or local tools.
          pkgs.git # flakes require Git to be installed, since this repo is version controlled
          pkgs.nodejs # building ags and configuring eslint_d will require nodejs
        ];
    };
  };
}
