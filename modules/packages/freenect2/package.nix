{ ... }:
{
  perSystem = { lib, pkgs, ...}:
  {
    packages.freenect2 = pkgs.stdenv.mkDerivation rec{
      pname = "freenect2";
      version = "0.2.1";

      src = pkgs.fetchFromGitHub {
        owner = "dedsec995";
        repo = "libfreenect2";
        # rev = "v${version}";
        # sha256 = "sha256-v+NQiR9LTQOwr1kgVpGmFSSemiPw4rmdQE/B6ycoLpU=";
        rev = "master";
        sha256 = "sha256-jdzj3hRbHdVGbWHfgW5jGJLxr8ENCYuBi855qAV+uc4=";
      };

      buildInputs = with pkgs; [
        libusb1
        libGL
        libxi
        libxmu
        libGLU
        libjpeg
        glfw
        opencv
        linuxPackages.v4l2loopback
      ];

      nativeBuildInputs = with pkgs; [
        cmake
        pkg-config
      ];

      prePatch = ''
        sed -i -e '93aINSTALL(TARGETS Protonect DESTINATION bin)' "examples/CMakeLists.txt"
      '';

      cmakeFlags = [
        "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
        "-DCMAKE_BUILD_TYPE=Release"
        "-DBUILD_EXAMPLES=ON"
        "-DENABLE_CXX11=ON"
      	"-DENABLE_OPENGL=ON"
      	"-DENABLE_OPENCL=ON"
      ];

      meta = {
        description = "Drivers and libraries for the Xbox Kinect 2 (XBOne version)";
        homepage = "https://github.com/OpenKinect/libfreenect2";
      };
    };
  };
}
