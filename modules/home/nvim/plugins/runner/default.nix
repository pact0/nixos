{pkgs, ...}: {

  programs.nixvim = {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "overseer.nvim";
      version = "1.4.0";
      src = pkgs.fetchFromGitHub {
        owner = "stevearc";
        repo = "overseer.nvim";
        rev= "d78fa84c06d37b1eb3bd42b4b5467c7476e74589";
        hash = "sha256-jcH5AwqKUaXylWv/rhDB+HJAdowRaCJoemtkv+RDHow=";
      };
    })
  ];

  extraConfigLua = ''
    require('overseer').setup()
  '';
};
}
