{pkgs, ...}: {
  imports = [
    ./zen.nix
  ];

  home.packages = [
    pkgs. tor-browser
  ];

  stylix.targets.librewolf.profileNames = ["default"];
  # stylix.targets.librewolf.colorTheme.enable = true;

  programs.librewolf = {
    enable = true;

    languagePacks = [
      "en-US"
      "pl"
    ];

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      Preferences = {
        "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
        "cookiebanners.service.mode" = 2; # Block cookie banners
        "privacy.donottrackheader.enabled" = true;
        "privacy.fingerprintingProtection" = true;
        "privacy.resistFingerprinting" = true;
        "privacy.trackingprotection.emailtracking.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
      };
      ExtensionSettings = {
        "jid1-ZAdIEUB7XOzOJw@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
          installation_mode = "force_installed";
        };
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "network.cookie.lifetimePolicy" = 0;

      "middlemouse.paste" = false;
      "general.autoScroll" = true;
    };

    profiles = {
      default = {
        isDefault = true;
        # bookmarks, extensions, search engines...
      };

      empty = {
        id = 1;
        isDefault = false;
      };
    };
  };
}
