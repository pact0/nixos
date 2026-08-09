let
  workspaceSelectors = [
    "w[t1]"
    "w[tg1]"
    "f[1]"
  ];
in {
  # Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
  # "Smart gaps" / "No gaps when only"
  wayland.windowManager.hyprland.extraConfig = ''
    local smartgapsSelectors = {
      ${builtins.concatStringsSep "\n" (map (s: "  \"${s}\",") workspaceSelectors)}
    }
    local smartgapsWorkspaceRules = {}
    local smartgapsWindowRules = {}

    for _, ws in ipairs(smartgapsSelectors) do
      table.insert(smartgapsWorkspaceRules, hl.workspace_rule({
        workspace = ws,
        gaps_out = 0,
        gaps_in = 0,
      }))
      table.insert(smartgapsWindowRules, hl.window_rule({
        name = "smartgaps-border-" .. ws,
        match = { float = false, workspace = ws },
        border_size = 0,
      }))
      table.insert(smartgapsWindowRules, hl.window_rule({
        name = "smartgaps-rounding-" .. ws,
        match = { float = false, workspace = ws },
        rounding = 0,
      }))
    end

    local function toggleSmartGaps()
      local enable = not smartgapsWorkspaceRules[1]:is_enabled()
      for _, rule in ipairs(smartgapsWorkspaceRules) do
        rule:set_enabled(enable)
      end
      for _, rule in ipairs(smartgapsWindowRules) do
        rule:set_enabled(enable)
      end
    end

    hl.bind(mod .. " + M", toggleSmartGaps)
  '';
}
