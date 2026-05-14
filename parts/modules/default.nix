{
  flake = {
    nixosModules = {
      default = builtins.throw "There is no default module!";
    };

    homeManagerModules = {
      default = builtins.throw "There is no default module!";
    };
  };
}
