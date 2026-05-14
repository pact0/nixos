{inputs', ...}: {
  home.packages = [
    inputs'.nvf.packages.default
  ];
}
