{lib, ...}: let
  isModuleFile = name: lib.hasSuffix ".nix" name && name != "default.nix";

  scan = prefix: dir:
    lib.concatMapAttrs
    (name: type: let
      path = "${dir}/${name}";
      rel = "${prefix}${name}";
      attr = lib.replaceStrings ["/"] ["-"] (lib.removeSuffix ".nix" rel);
    in
      if type == "directory"
      then {${attr} = path;} // scan "${rel}-" path
      else if isModuleFile name
      then {${attr} = path;}
      else {})
    (builtins.readDir dir);
in {
  flake = {
    nixosModules =
      scan "" ../../modules
      // {
        default = builtins.throw "There is no default module!";
      };

    homeManagerModules = {
      default = builtins.throw "There is no default module!";
    };
  };
}
