{pkgs, ...}: {
  # imports = [(import ./theme-template.nix)];
  # home.packages = with pkgs; [
  #   (discord.override {
  #     withVencord = true;
  #     withOpenASAR = true;
  #   })
  # ];

  home.packages = with pkgs; [
    vesktop
  ];
}
