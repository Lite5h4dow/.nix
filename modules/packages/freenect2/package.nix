{ ... }:
{
  perSystem = { lib, pkgs, ...}:
  {
    packages.freenect2 = pkgs.stdenv.mkDerivation rec{
      pname = "freenect2";
      version = "0.2.1";

      src = pkgs.fetchFromGitHub {
        owner = "OpenKinect";
        repo = "libfreenect2";
        rev = "v${version}";
        sha256 = "sha256-v+NQiR9LTQOwr1kgVpGmFSSemiPw4rmdQE/B6ycoLpU=";
      };

      buildInputs = with pkgs; [
        libusb1
        libGL
        libxi
        libxmu
        libGLU
        libjpeg
      ];

      nativeBuildInputs = with pkgs; [
        cmake
        pkg-config
      ];

      cmakeFlags = [
        "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
      ];

      meta = {
        description = "Drivers and libraries for the Xbox Kinect 2 (XBOne version)";
        homepage = "https://github.com/OpenKinect/libfreenect2";
        
      };
    };
  };
}
