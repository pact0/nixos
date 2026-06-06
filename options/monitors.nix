{lib, ...}:
with lib.types; {
  options.monitors = {
    kanshi = {
      enable = lib.mkOption {
        type = bool;
        default = false;
        description = "Enable kanshi with host-specific profiles";
      };

      profiles = lib.mkOption {
        type = listOf attrs;
        default = [];
        description = "Kanshi output profiles";
      };
    };

    dms = {
      monitorWallpapers = lib.mkOption {
        type = attrsOf str;
        default = {};
        description = "Per-monitor wallpaper paths for DMS";
      };

      screenPreferences = lib.mkOption {
        type = attrsOf anything;
        default = {};
        description = "DMS screen preferences (dock, notepad, notifications, osd, wallpaper)";
      };

      showOnLastDisplay = lib.mkOption {
        type = attrsOf bool;
        default = {};
        description = "DMS show-on-last-display settings";
      };

      barScreenPreferences = lib.mkOption {
        type = listOf attrs;
        default = [];
        description = "DMS bar screenPreferences override";
      };
    };
  };
}
