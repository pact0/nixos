{
  programs.ripgrep = {
    enable = true;

    arguments = [
      "--max-columns=150"
      "--max-columns-preview"

      # ignore git files
      "--glob=!.git/*"

      "--smart-case"
    ];
  };
}
