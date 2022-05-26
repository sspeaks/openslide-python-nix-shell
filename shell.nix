let
	pkgs = import <nixpkgs> {};
        openslideP =  pkgs.python39Packages.buildPythonPackage rec {
            pname = "openslide-python";
            version = "1.1.2";
            src = pkgs.python39Packages.fetchPypi {
              inherit pname version;
              sha256 = "00f5e34dca56500b598454107a0acf243788ea2072b5468b3fea59f756b832a8";
            };
            buildInputs = with pkgs; [openslide];
            postPatch = ''
    sed -i 's|LoadLibrary('\'''libopenslide.so.0'\''')|LoadLibrary('\'''${pkgs.openslide}/lib/libopenslide.so.0'\''')|' openslide/lowlevel.py
  '';
            propagatedBuildInputs = with pkgs.python39Packages; [pillow];
          };
        myPython = pkgs.python39.withPackages(ps: [openslideP]);
in
  myPython.env
