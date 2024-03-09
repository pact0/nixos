{...}: {
  imports = [
     (import ./bat)
     (import ./btop)
     (import ./git)
     (import ./nvim)
     (import ./kitty)
     (import ./sound)
     (import ./mpv)
     (import ./mako)
     #(import ./packages)
     #(import ./gtk)
     (import ./hyprland)
     (import ./discord)
     (import ./zathura)
     (import ./obs)
     (import ./vscodium)

     (import ./shell)
     (import ./waybar)
     (import ./style)
  ];
  programs.firefox.enable = true;
  programs.foot.enable = true;



}