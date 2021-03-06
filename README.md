# Zettlr build test

Test build Zettlr with different versions of node.

- arch.sh

Run with my [xatier/arch-dev container](https://github.com/xatier/dockerfiles/tree/master/arch-dev).

```bash
podman run --rm -ti  -v "$(pwd)/arch.sh:/home/xatier/run.sh:rw" xatier/arch-dev '/home/xatier/run.sh'
```

- ubuntu.sh

Run with `ubuntu` image on dockerhub

```bash
podman run --rm -ti -v "$PWD/ubuntu.sh:/t.sh" ubuntu '/t.sh'
```

## findings

With certain `node` versions, `electron-forge` would hang on `Packaging Application`.

@david50407 and I suspect it's something to do with `electron-forge` or `electron-packager`.

### Archlinux

- Arch [Node.js](https://wiki.archlinux.org/index.php/Node.js) wiki.
- 15.x (current package) bad
- 14.x good
- 12.x good

### Ubuntu

- it seems the split is between `15.2.0` and `15.1.0`.
  - `n 14.15.1` good
  - `n 15.0.0` good
  - `n 15.0.1` good
  - `n 15.1.0` good
  - `n 15.2.0` bad
  - `n 15.2.1` bad
  - `n 15.3.0` bad

## suggestion

Use [Node.js LTS release](https://nodejs.org/en/about/releases/).

Current active LTS is v14 Fermium (2020-10-27 - 2021-10-19).

```bash
# archlinux
pacman -S nodejs-lts-fermium

# ubuntu/debian
curl -sL https://deb.nodesource.com/setup_lts.x | bash -
apt install -y nodejs
```
