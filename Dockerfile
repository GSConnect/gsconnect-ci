FROM fedora:36
LABEL org.opencontainers.image.source="https://github.com/GSConnect/gsconnect-ci" org.gsconnect.gnome.version="42"

RUN dnf --setopt install_weak_deps=false -y install glibc-langpack-en && \
    dnf clean all && \
    rm -rf /var/cache/dnf
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN dnf --setopt install_weak_deps=false -y install \
        appstream \
        desktop-file-utils \
        dbus-devel \
        gcc \
        make \
        gcc-c++ \
        gettext \
        git \
        glib2-devel \
        gnome-shell \
        gnome-desktop-testing \
        meson \
        openssl \
        python3 \
        python3-pip \
        xorg-x11-server-Xvfb \
        zip && \
    dnf clean all && \
    rm -rf /var/cache/dnf

# Install newer nodejs repos from nodesource
RUN curl -sL https://rpm.nodesource.com/setup_18.x | sudo -E bash -

# Now install node and npm
RUN dnf --setopt install_weak_deps=false -y install \
        nodejs \
        npm && \
    dnf clean all && \
    rm -rf /var/cache/dnf

# Install eslint
RUN npm install -g eslint globals @eslint/js @eslint/eslintrc && \
    npm cache clean --force

# Install Python linting tools
RUN python3 -m pip --no-cache-dir --no-input install black flake8
