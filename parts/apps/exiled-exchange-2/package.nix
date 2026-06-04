{pkgs}:
pkgs.stdenv.mkDerivation (finalAttrs: {
  pname = "exiled-exchange-2";
  version = "0.15.0";

  src = pkgs.fetchurl {
    url = "https://github.com/Kvan7/Exiled-Exchange-2/releases/download/v${finalAttrs.version}/Exiled-Exchange-2-${finalAttrs.version}.AppImage";
    hash = "sha256-THhGsptgZ90WU/ZXVWR/P5wV24uAFM5OGUgBUAhywMs=";
  };

  passthru.appImageContents = pkgs.appimageTools.extractType2 {
    inherit (finalAttrs) pname src version;
  };

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = [pkgs.makeWrapper];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/share/exiled-exchange-2 $out/share/applications

    cp -a ${finalAttrs.passthru.appImageContents}/{locales,resources} $out/share/exiled-exchange-2
    cp -a ${finalAttrs.passthru.appImageContents}/exiled-exchange-2.desktop $out/share/applications/
    cp -a ${finalAttrs.passthru.appImageContents}/usr/share/icons $out/share

    substituteInPlace $out/share/applications/exiled-exchange-2.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=exiled-exchange-2'

    runHook postInstall
  '';

  postFixup = ''
    makeWrapper ${pkgs.lib.getExe pkgs.electron} $out/bin/exiled-exchange-2 \
      --add-flags $out/share/exiled-exchange-2/resources/app.asar \
      --prefix LD_LIBRARY_PATH : "${pkgs.lib.makeLibraryPath [pkgs.libxtst pkgs.libxt]}"
  '';

  meta = {
    description = "Path of Exile 2 trading app for price checking";
    homepage = "https://github.com/Kvan7/Exiled-Exchange-2";
    changelog = "https://github.com/Kvan7/Exiled-Exchange-2/releases/tag/v${finalAttrs.version}";
    sourceProvenance = [pkgs.lib.sourceTypes.binaryNativeCode];
    license = pkgs.lib.licenses.mit;
    platforms = pkgs.lib.platforms.linux;
    mainProgram = "exiled-exchange-2";
  };
})
