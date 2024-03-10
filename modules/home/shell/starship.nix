{
  lib,
  inputs,
  config,
  ...
}: {
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    enableFishIntegration = true;

    settings = {
      line_break.disabled = false;

      right_format = "$cmd_duration";

      directory = {
        format = "[ ](bold #${config.lib.stylix.colors.base0A})[ $path ]($style)";
        style = "bold #${config.lib.stylix.colors.base05}";
      };

      character = {
        success_symbol = "[ ](bold #${config.lib.stylix.colors.base0D})[ ➜](bold green)";
        error_symbol = "[ ](bold #${config.lib.stylix.colors.base0D})[ ➜](bold red)";
      };

      cmd_duration = {
        format = "[]($style)[[󰔚 ](bg:#${config.lib.stylix.colors.base01} fg:#${config.lib.stylix.colors.base04} bold)$duration](bg:#${config.lib.stylix.colors.base01} fg:#${config.lib.stylix.colors.base05})[ ]($style)";
        disabled = false;
        style = "bg:none fg:#${config.lib.stylix.colors.base01}";
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
