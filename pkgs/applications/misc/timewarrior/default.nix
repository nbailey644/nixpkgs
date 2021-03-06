{ stdenv, fetchurl, cmake, libuuid, gnutls }:

stdenv.mkDerivation rec {
  name = "timewarrior-${version}";
  version = "1.1.1";

  enableParallelBuilding = true;

  src = fetchurl {
    url = "https://taskwarrior.org/download/timew-${version}.tar.gz";
    sha256 = "1jfcfzdwk5qqhxznj1bgy0sx3lnp3z5lqr9kch9a7iazwmi9lz8z";
  };

  nativeBuildInputs = [ cmake ];

  meta = with stdenv.lib; {
    description = "A command-line time tracker";
    homepage = https://tasktools.org/projects/timewarrior.html;
    license = licenses.mit;
    maintainers = with maintainers; [ matthiasbeyer mrVanDalo ];
    platforms = platforms.linux;
  };
}

