{config, ...}: {
  programs.starship = with config.lib.stylix.colors; {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    enableFishIntegration = true;

    settings = {
      line_break.disabled = false;

      right_format = "$cmd_duration";

      directory = {
        format = "[ ](bold #${base0A})[ $path ]($style)";
        style = "bold #${base05}";
      };

      character = {
        success_symbol = "[ ](bold #${base0D})[ ➜](bold green)";
        error_symbol = "[ ](bold #${base0D})[ ➜](bold red)";
      };

      cmd_duration = {
        format = "[]($style)[[󰔚 ](bg:#${base01} fg:#${base04} bold)$duration](bg:#${base01} fg:#${base05})[ ]($style)";
        disabled = false;
        style = "bg:none fg:#${base01}";
      };

      directory.substitutions = {
        "~" = "󰋞";
        "Documents" = "󰷉 ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
      };

      # git_status = {
      #   format = "[](fg:#232526 bg:none)[$all_status $ahead_behind]($style)[](fg:#232526 bg:#232526)";
      #   style = "fg:#D4BE98 bg:#232526";
      #   conflicted = "=";
      #   ahead = "⇡$\{count\}";
      #   behind = "⇣$\{count\}";
      #   diverged = "⇕⇡$\{ahead_count\}⇣$\{behind_count\}";
      #   up_to_date = "✓";
      #   untracked = "?$\{count\}";
      #   stashed = "📦";
      #   modified = "!$\{count\}";
      #   staged = "+$\{count\}";
      #   renamed = "»$\{count\}";
      #   deleted = "$\{count\}";
      # };
    };
  };
}
