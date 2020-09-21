FROM fedora:33

RUN dnf install -y glibc-langpack-en
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN dnf install -y appstream gcc gettext git glib2-devel gnome-shell \
                   gnome-desktop-testing lcov meson npm xorg-x11-server-Xvfb
                   zip && \
    dnf clean all && \
    rm -rf /var/cache/yum

# Install eslint
RUN npm install -g eslint

