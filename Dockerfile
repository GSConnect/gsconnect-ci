FROM fedora:36
LABEL org.opencontainers.image.source=https://github.com/GSConnect/gsconnect-ci

RUN dnf --setopt install_weak_deps=false -y install glibc-langpack-en && \
	dnf clean all && \
	rm -rf /var/cache/dnf
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN dnf --setopt install_weak_deps=false -y install \
		appstream desktop-file-utils gcc gettext git glib2-devel \
		gnome-shell gnome-desktop-testing meson npm \
		xorg-x11-server-Xvfb zip && \
	dnf clean all && \
	rm -rf /var/cache/dnf

# Install eslint
RUN npm install -g eslint && \
	npm cache clean --force

