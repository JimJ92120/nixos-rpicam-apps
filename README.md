# nixos-rpicam-apps

Packaging [`raspberrypi/rpicam-apps`](https://github.com/raspberrypi/rpicam-apps) and [`raspberrypi/libcamera`](https://github.com/raspberrypi/libcamera) for **NixOS**.

---

# setup

The package is meant to run on `aarch64-linux` systems.  
See [cross-compilation](https://nixos.wiki/wiki/Cross_Compiling).

```sh
git clone <repository-name>
```

---

# use

```nix
let
  rpicam-apps = import /path/to/nixos-rpicam-apps/package.nix
in
{
  environment.systemPackages = [
    rpicam-apps
  ];
}
```

---

---

#
