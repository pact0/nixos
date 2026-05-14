{lib, ...}: let
  general = ''
    .cache/
    tmp/
    *.tmp
    log/
  '';

  ide = ''
    *.swp
    .idea/
    .~lock*
  '';

  c = ''
    .tags
    tags
    *~
    *.o
    *.so
    *.cmake
    CMakeCache.txt
    CMakeFiles/
    cmake-build-debug/
    compile_commands.json
    .ccls*
  '';

  nix = ''
    result
    result-*
    .direnv/
  '';

  node = ''
    node_modules/
  '';

  python = ''
    venv
    .venv
    *pyc
    *.egg-info/
    __pycached__/
    .mypy_cache
  '';

  ignore = lib.concatStringsSep "\n" [general c nix node ide python];
in {
  programs.git.ignores = map (v: "${toString v}") (builtins.split "\n" ignore);
}
