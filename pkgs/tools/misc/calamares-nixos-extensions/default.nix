{ stdenv, fetchFromGitHub, lib }:

stdenv.mkDerivation rec {
  pname = "calamares-nixos-extensions";
  version = "luks2";

  src = fetchFromGitHub {
    owner = "cleeyv";
    repo = "calamares-nixos-extensions";
    rev = "4e362343549053fa26fef016c91d7c2acb4e20d7";
    hash = "sha256-T+0NRdFVJ/02xnCwDgoFKdWQnYEKNtN6utYK+c/MrpU=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/{lib,share}/calamares
    cp -r modules $out/lib/calamares/
    cp -r config/* $out/share/calamares/
    cp -r branding $out/share/calamares/
    runHook postInstall
  '';

  meta = with lib; {
    description = "Calamares modules for NixOS";
    homepage = "https://github.com/NixOS/calamares-nixos-extensions";
    license = with licenses; [ gpl3Plus bsd2 cc-by-40 cc-by-sa-40 cc0 ];
    maintainers = with maintainers; [ vlinkz ];
    platforms = platforms.linux;
  };
}
