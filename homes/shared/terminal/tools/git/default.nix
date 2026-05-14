{
  osConfig,
  pkgs,
  ...
}: let
  inherit (osConfig) modules;

  gitPackage = pkgs.gitFull;
  cfg = modules.system.programs.git;
in {
  imports = [
    ./aliases.nix
    ./ignore.nix
  ];

  config = {
    home.packages = with pkgs; [
      gist # manage github gists
      act # local github actions
      delta # pager
    ];

    programs.git = {
      enable = true;
      package = gitPackage;

      lfs = {
        enable = true;
        skipSmudge = true;
      };

      settings = {
        user = {
          name = "pacto";
          email = "kuba.kowalski21331@gmail.com";
        };

        init.defaultBranch = "main";

        core = {
          pager = "delta";

          askPass = "";

          whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
        };

        credential.helper = "${gitPackage}/bin/git-credential-libsecret";
        diff.mnemonicprefix = true;

        delta = {
          enable = true;
          features = "decorations side-by-side navigate";
          whitespace-error-style = "22 reverse";
          side-by-side = true;
          true-color = "always";

          options = {
            dark = true;
            navigate = true;
            line-numbers = true;
            side-by-side = true;
            syntax-theme = "base16-256";
          };

          line-numbers = true;
          line-numbers-left-format = "";
          line-numbers-right-format = "│ ";

          plus-style = "syntax \"#003800\"";
          minus-style = "syntax \"#3f0001\"";

          decorations = {
            commit-decoration-style = "cyan bold box ul";
            file-style = "cyan bold ul";
            file-decoration-style = "cyan bold ul";
            hunk-header-decoration-style = "cyan box ul";
          };
        };

        interactive.diffFilter = "delta --color-only --features=interactive";

        branch.autosetupmerge = "true";
        pull.ff = "only";
        color.ui = "auto";
        repack.usedeltabaseoffset = "true";

        push = {
          default = "current";
          followTags = true;
          autoSetupRemote = true;
        };

        merge = {
          conflictstyle = "diff3";
          stat = "true";
        };

        rebase = {
          autoSquash = true;
          autoStash = true;
        };

        rerere = {
          autoupdate = true;
          enabled = true;
        };

        url = {
          "https://github.com/".insteadOf = "github:";
          "ssh://git@github.com/".pushInsteadOf = "github:";
          "https://gitlab.com/".insteadOf = "gitlab:";
          "ssh://git@gitlab.com/".pushInsteadOf = "gitlab:";
          "https://aur.archlinux.org/".insteadOf = "aur:";
          "ssh://aur@aur.archlinux.org/".pushInsteadOf = "aur:";
          "https://git.sr.ht/".insteadOf = "srht:";
          "ssh://git@git.sr.ht/".pushInsteadOf = "srht:";
          "https://codeberg.org/".insteadOf = "codeberg:";
          "ssh://git@codeberg.org/".pushInsteadOf = "codeberg:";
        };
      };
    };
  };
}
