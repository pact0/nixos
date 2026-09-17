{
  perSystem = {
    pkgs,
    lib,
    ...
  }: let
    inherit (import ../utils.nix {inherit pkgs lib;}) mkHook;
  in {
    pre-commit.settings.hooks.gitleaks = mkHook "gitleaks" {
      enable = true;
      language = "system";
      pass_filenames = false;
      # Scan the whole tree rather than a git diff so it also works in the
      # git-less sandbox used by `nix flake check`.
      entry = "${pkgs.gitleaks}/bin/gitleaks detect --source . --redact --verbose";
    };
  };
}
