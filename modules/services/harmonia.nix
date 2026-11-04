_: let
  # Keep the port in one place: it is used by both harmonia and the firewall.
  port = 5000;
in {
  services.harmonia = {
    cache = {
      enable = true;

      # Generate this key once on the cache host, then back it up. Regenerating
      # it invalidates the public key configured on every client.
      #   install -d -m 0755 /var/lib/secrets
      #   nix-store --generate-binary-cache-key nixos-vm-1 \
      #     /var/lib/secrets/harmonia.secret /var/lib/secrets/harmonia.pub
      #   chmod 0400 /var/lib/secrets/harmonia.secret
      signKeyPaths = ["/var/lib/secrets/harmonia.secret"];

      settings = {
        bind = "[::]:${toString port}";

        # Lower numbers win during substitution. 40 puts this cache after
        # cache.nixos.org (priority 10) but before the default-priority
        # community caches (50), so locally built paths are found here first.
        priority = 40;
      };
    };

    # A cache host fills its store over time. Keep it bounded automatically.
    gc = {
      enable = true;
      automatic = true;
      dates = "weekly";
      deleteOlderThan = "30d";
      keepRecent = "1d";
    };
  };

  # The NixOS harmonia module deliberately does not open the firewall.
  networking.firewall.allowedTCPPorts = [port];

  # If you later manage the key with sops-nix, point signKeyPaths at
  # config.sops.secrets.harmonia-key.path and declare sops.secrets.harmonia-key.

  # Optional hardening/behaviour tweaks (the defaults are already sane):
  #services.harmonia.cache.settings.workers = 4;
  #nix.settings.allowed-users = ["harmonia"];
}
