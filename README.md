# GSConnect CI

Docker image for [GSConnect][gsconnect] CI.

[gsconnect]: https://github.com/andyholmes/gnome-shell-extension-gsconnect

## GitHub Container Registry

Images are automatically deployed from release tags/branches
to the GitHub Container Registry.

The latest image will be listed under "Packages" on the repo homepage.

To use from another GitHub Actions workflow:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/gsconnect/gsconnect-ci:latest
    steps:
      - uses: actions/checkout@v2

      - name: Prep environment
        run: >
          meson --prefix=/usr
                --libdir=lib/
                -Dgnome_shell_libdir=/usr/lib
                -Dpost_install=true
                _build

      - name: Run uninstalled tests
        run: >
          meson test -C _build
                --suite gsconnect:data
                --suite gsconnect:lint
                --print-errorlogs

      - name: Run installed tests
        run: |
          ninja -C _build install
          xvfb-run -a dbus-run-session -- \
            gnome-desktop-testing-runner gsconnect -L _build/meson-logs
```
