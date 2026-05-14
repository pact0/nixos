{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["Noto Serif"];
        sansSerif = ["Lexend" "Noto Sans"];
        monospace = [
          "Iosevka Nerd Font"
          "Noto Sans Mono"
          "Source Han Mono"
        ];
        emoji = ["Noto Color Emoji"];
      };
    };

    packages = with pkgs; [
      # core fallback
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

      # programming
      nerd-fonts.iosevka
      nerd-fonts.symbols-only

      # optional UI font
      lexend

      # last-resort fallback
      unifont
    ];
  };
}
