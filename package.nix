with import <nixpkgs> {};

let 
  libcamera = import ./packages/libcamera.nix;
in
pkgs.stdenv.mkDerivation {
  name = "rpicam-apps";

  # https://github.com/raspberrypi/rpicam-apps
  src = builtins.fetchGit { 
    url = "https://github.com/raspberrypi/rpicam-apps.git"; 
  };

  nativeBuildInputs = with pkgs; [
    meson
    pkg-config
  ];

  buildInputs = with pkgs; [
    libjpeg
    libtiff
    libepoxy
    boost
    libexif
    libpng
    ffmpeg
    libdrm
    ninja
  ] ++ [
    libcamera
  ];

  mesonFlags = [
    "-Denable_libav=disabled"
    "-Denable_drm=enabled"
    "-Denable_egl=disabled"
    "-Denable_qt=disabled"
    "-Denable_opencv=disabled"
    "-Denable_tflite=disabled"
    "-Denable_hailo=disabled"
  ];

  env = {
    NIX_CFLAGS_COMPILE = "-Wno-unused-result";
    BOOST_INCLUDEDIR = "${lib.getDev pkgs.boost}/include";
    BOOST_LIBRARYDIR = "${lib.getLib pkgs.boost}/lib";
  };
}
