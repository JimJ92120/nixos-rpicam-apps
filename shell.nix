with import <nixpkgs> {};

let
  rpicam-apps = import ./package.nix;
in
stdenv.mkDerivation {
  name = "raspberry-pi";

  buildInputs = [
    rpicam-apps
  ];

  shellHook = ''
    echo "raspberrypi/libcamera and raspberrypi/rpicam-apps installed"
    echo ""

    rpicam-still --version
  '';
}
