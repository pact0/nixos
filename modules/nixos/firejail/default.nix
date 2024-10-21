{pkgs, ...}: {
  environment.systemPackages = with pkgs; [firejail];
  programs.firejail.enable = true;
  programs.firejail.wrappedBinaries = {
    steam = {
      executable = "${pkgs.steam}/bin/steam";
      profile = "${pkgs.firejail}/etc/firejail/steam.profile";
    };
    steam-run = {
      executable = "${pkgs.steam}/bin/steam-run";
      profile = "${pkgs.firejail}/etc/firejail/steam.profile";
    };
    firefox = {
      executable = "${pkgs.steam}/bin/firefox";
      profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
    };
  };
}
