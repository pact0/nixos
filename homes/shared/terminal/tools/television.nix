{
  programs.television = {
    enable = true;

    channels = {
      git-diff = {
        metadata = {
          description = "A channel to select files from git diff commands";
          name = "git-diff";
          requirements = [
            "git"
          ];
        };
        preview = {
          command = "git diff HEAD --color=always -- '{}'";
        };
        source = {
          command = "git diff --name-only HEAD";
        };
      };
      git-log = {
        metadata = {
          description = "A channel to select from git log entries";
          name = "git-log";
          requirements = [
            "git"
          ];
        };
        preview = {
          command = "git show -p --stat --pretty=fuller --color=always '{0}'";
        };
        source = {
          command = "git log --oneline --date=short --pretty=\"format:%h %s %an %cd\" \"$@\"";
          output = "{split: :0}";
        };
      };

      sesh = {
        metadata = {
          description = "Session manager integrating tmux sessions, zoxide directories, and config paths";
          name = "sesh";
          requirements = [
            "sesh"
            "fd"
          ];
        };
        keybindings = {
          enter = "actions:connect";
          "ctrl-d" = ["actions:kill_session" "reload_source"];
        };
        preview = {
          command = "sesh preview '{strip_ansi|split: :1..|join: }'";
        };
        source = {
          command = ["sesh list --icons" "sesh list -t --icons" "sesh list -c --icons" "sesh list -z --icons" "fd -H -d 2 -t d -E .Trash . ~"];

          output = "{strip_ansi|split: :1..|join: }";
          ansi = true;
        };
        actions.connect = {
          description = "Connect to selected session";
          command = "sesh connect '{strip_ansi|split: :1..|join: }'";
          mode = "execute";
        };

        actions.kill_session = {
          description = "Kill selected tmux session (press Ctrl+r to reload)";
          command = "tmux kill-session -t '{strip_ansi|split: :1..|join: }'";
          mode = "fork";
        };
      };
    };
  };
}
