{pkgs, ...}: {
  config = {
    home.packages = [
      (
        pkgs.symlinkJoin {
          name = "Obsidian";
          paths = with pkgs; [
            obsidian
            pandoc
          ];
        }
      )
    ];
  };
}
