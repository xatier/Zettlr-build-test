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
