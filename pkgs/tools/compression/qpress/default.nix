{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "qpress";
  version = "20220819";

  src = fetchFromGitHub {
    owner = "PierreLvx";
    repo = "qpress";
    rev = version;
    sha256 = "cKodqFFBridc8gSepiLd1yhNKh3sXqScr/XZHkJfrk4=";
  };

  enableParallelBuilding = true;

  installPhase = ''
    mkdir -p $out/bin
    mv qpress $out/bin
  '';

  postPatch = ''
    substituteInPlace makefile --replace 'g++' '$(CXX)'
  '';

  makeFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "Patched version of the qpress file archiver";
    homepage = "https://github.com/PierreLvx/qpress";
    maintainers = with maintainers; [ cleeyv ];
    license = licenses.gpl3;
    platforms = platforms.unix;
  };
}
