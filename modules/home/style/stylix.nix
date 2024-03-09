{inputs, username, stylix, ...}: {
    imports  = [stylix.homeManagerModules.stylix ];
    stylix.targets.alacritty.enable = true;
}
