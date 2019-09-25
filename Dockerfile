FROM ubuntu:bionic
LABEL maintainer="nugulinux@gmail.com" \
      version="0.1" \
      description="nugulinux sdk"

ENV DEBIAN_FRONTEND=noninteractive \
    LC_ALL=en_US.UTF-8 \
    LANG=$LC_ALL

RUN apt-get update && apt-get install -y software-properties-common ca-certificates language-pack-en \
    && locale-gen $LC_ALL \
    && dpkg-reconfigure locales \
    && add-apt-repository -y ppa:nugulinux/sdk \
    && apt-get install -y --no-install-recommends \
    dbus \
    gstreamer1.0-pulseaudio \
    gstreamer1.0-tools \
    libnugu \
    libnugu-plugins-default \
    libnugu-examples \
    mdbus2 \
    pulseaudio \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080

ENV SHELL=/bin/bash
COPY startup.sh /usr/bin/
ENTRYPOINT ["/usr/bin/startup.sh"]
CMD ["/bin/bash"]

