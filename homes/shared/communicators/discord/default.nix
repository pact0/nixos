{
  programs.vesktop = {
    enable = true;

    settings = {
      discordBranch = "stable";
      minimizeToTray = true;
      tray = true;
      autoStartMinimized = true;
    };

    vencord.settings = {
      autoUpdate = false;
      autoUpdateNotification = false;

      useQuickCss = true;
      enabledThemes = ["stylix.theme.css"];

      notifications = {
        timeout = 5000;
        position = "bottom-right";
        useNative = "not-focused";
        logLimit = 50;
      };

      plugins = {
        ChatInputButtonAPI.enabled = true;
        CommandsAPI.enabled = true;
        MessageAccessoriesAPI.enabled = true;
        MessageEventsAPI.enabled = true;
        MessagePopoverAPI.enabled = true;
        UserSettingsAPI.enabled = true;

        AlwaysAnimate.enabled = true;
        AlwaysExpandRoles.enabled = true;
        AlwaysTrust.enabled = true;
        BetterGifPicker.enabled = true;
        BetterSessions.enabled = true;
        BetterSettings.enabled = true;
        BetterUploadButton.enabled = true;
        BiggerStreamPreview.enabled = true;
        CallTimer.enabled = true;
        ClearURLs.enabled = true;
        CopyFileContents.enabled = true;
        CrashHandler.enabled = true;
        Dearrow.enabled = true;
        DisableCallIdle.enabled = true;
        FixCodeblockGap.enabled = true;
        ImageLink.enabled = true;
        MemberCount.enabled = true;
        NoScreensharePreview.enabled = true;
        OpenInApp.enabled = true;
        PreviewMessage.enabled = true;
        SilentTyping.enabled = true;
        Translate.enabled = true;
        TypingTweaks.enabled = true;
        VolumeBooster.enabled = true;
        WebKeybinds.enabled = true;
        WebScreenShareFixes.enabled = true;

        NoTrack = {
          enabled = true;
          disableAnalytics = true;
        };
        WebContextMenus = {
          enabled = true;
          addBack = true;
        };
        Settings = {
          enabled = true;
          settingsLocation = "aboveNitro";
        };
        SupportHelper.enabled = true;
      };
    };
  };
}
