{
  pkgs,
  username,
  ...
}: {
  programs.git = {
    enable = true;

    userName = username;
    userEmail = "kuba.kowalski21331@gmail.com";

    ignores = [
      "*.log"
      ".envrc"
      "shell.nix"
    ];

    aliases = {
      a = "commit --amend";
      adc = "commit --amend --no-edit";
      br = "branch --list --remote";
      c = "commit";
      ca = "!git add -A && gitmoji -c"; # Commit all changes.
      co = "checkout";
      cp = "cherry-pick";
      d = "diff";
      dc = "diff --cached";
      f = "fetch --prune";
      g = "log --graph --pretty=custom"; # Show custom graph.
      l = "log --pretty=custom"; # Show custom log.
      lc = "shortlog --email --numbered --summary"; # List contributors.
      lg = "log --graph --date=relative --pretty=format:'%C(bold blue)%h%C(reset) - %C(green)(%ar) %C(white)%s %C(dim white) [%an] %C(bold yellow)%d'";
      lgall = "log --all --graph --date=relative --pretty=format:'%C(bold blue)%h%C(reset) - %C(green)(%ar) %C(white)%s %C(dim white) [%an] %C(bold yellow)%d'";
      lh = "log -p -10"; # Show custom log.
      p = "pull";
      rank = "shortlog -sn --no-merges";
      rlc = "reset --hard HEAD~1"; # Remove last commit.
      s = "status";
      sres = "reset --soft HEAD~1"; # Undo last commit.
      res = "reset --hard HEAD";
      cl = "clean -fxd";
      sub = "submodule update --init --recursive";
      w = "instaweb --httpd=webrick"; # Start web-based visualizer.

      # Find commits by source code.
      cc = "!f() {
        git log --pretty=custom --decorate --date=short -S\"$1\";
        }; f";

      # Find commits by commit message.
      cm = "!f() {
        git log --pretty=custom --decorate --date=short --grep=\"$1\";
        }; f";

      # Credit an author on the latest commit.
      credit = "!f() {
        if [ -n \"$1\" ] && [ -n \"$2\" ]; then
            git commit --amend --author \"$1 <$2>\" -C HEAD;
        fi
        }; f";

      # List remote branches.
      #lrb = "!f() { \
      #  remote=\"${1-origin}\";
      #  git ls-remote --heads \"$remote\";
      #  }; f";
    };

    extraConfig = {
      init.defaultBranch = "master";
      credential.helper = "store";
      safe.directory = "/home/pacto/dotfiles";
      pretty.custom = "%C(magenta)%h%C(red)%d %C(yellow)%ar %C(green)%s %C(yellow)(%an)";

      color = {
        ui = true;
        pager = true;
        diff = "auto";
        branch = {
          current = "green bold";
          local = "yellow dim";
          remove = "blue";
        };

        showBranch = "auto";
        interactive = "auto";
        grep = "auto";
        status = {
          added = "green";
          changed = "yellow";
          untracked = "red dim";
          branch = "cyan";
          header = "dim white";
          nobranch = "white";
        };
      };
    };

    delta.enable = true;
  };

  home.packages = [pkgs.gh];
}
