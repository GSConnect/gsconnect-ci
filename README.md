# GSConnect CI

Docker image for [GSConnect][gsconnect] CI.

[gsconnect]: https://github.com/andyholmes/gnome-shell-extension-gsconnect


## Create and publish a new image

```sh
$ git clone git@github.com:GSConnect/gsconnect-ci.git
$ cd gsconnect-ci
$ git checkout -b ${GNOME_VERSION}
$ # Edit Dockerfile - probably to bump Fedora version
$ git push -u origin ${GNOME_VERSION}
$ podman build -t gsconnect/gsconnect-ci:${GNOME_VERSION} .
# docker build -t gsconnect/gsconnect-ci:${GNOME_VERSION} .
$ podman push gsconnect/gsconnect-ci:${GNOME_VERSION}
# docker push gsconnect/gsconnect-ci:${GNOME_VERSION}
```
