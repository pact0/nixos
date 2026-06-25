{pkgs, ...}: {
  imports = [
    ./git
    ./yazi

    ./bat.nix
    ./bottom.nix
    ./dircolors.nix
    ./editorconfig.nix
    ./eza.nix
    ./fzf.nix
    ./gh.nix
    ./man.nix
    ./nix-direnv.nix
    ./ripgrep.nix
    ./tmux.nix
    ./zoxide.nix
    ./zip.nix

    ./neovim.nix
    ./television.nix
    ./sesh.nix
    ./worktrunk.nix
    ./atuin.nix
  ];
}
