{ ... }:
{
  perSystem = { stdenv, lib, pkgs, ...}:
  {
    packages.freenect2 = stdenv.mkDerivation rec{
      pname = "freenect2";
      version = "0.2.1";

      src = lib.fetchFromGitHub {
        owner = "OpenKinect";
        repo = "libfreenect2";
        rev = "v${version}";
        sha = lib.fakeHash;
      };

      buildInputs = with pkgs; [
        libusb1
        libGL
        libXi
        libXmu
        libGLU
        libglut
      ];

      nativeBuildInputs = with pkgs; [
        cmake
        pkg-config
      ];

      patchPhase = lib.concatMapStrings (x: ''substituteInPlace ${x} --replace "{GLUT_LIBRARY}" "{GLUT_LIBRARIES}"'') [
        "examples/CMakeLists.txt"
        "wrappers/cpp/CMakeLists.txt"
      ];

      meta = {
        description = "Drivers and libraries for the Xbox Kinect 2 (XBOne version)";
        homepage = "https://github.com/OpenKinect/libfreenect2";
        
      };
    };
  };
}
