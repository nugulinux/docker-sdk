FROM ubuntu:bionic
LABEL maintainer="webispy@gmail.com" \
      version="0.1" \
      description="nugulinux sdk"

ENV DEBIAN_FRONTEND=noninteractive \
    LC_ALL=en_US.UTF-8 \
    LANG=$LC_ALL

RUN apt-get update && apt-get install -y software-properties-common \
    ca-certificates language-pack-en ubuntu-dbgsym-keyring \
    && locale-gen $LC_ALL \
    && dpkg-reconfigure locales \
    && echo "deb http://ddebs.ubuntu.com bionic main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://ddebs.ubuntu.com bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://ddebs.ubuntu.com bionic-proposed main restricted universe multiverse" >> etc/apt/sources.list \
    && add-apt-repository -y ppa:nugulinux/sdk \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    apt-utils \
    binfmt-support \
    ca-certificates \
    dbus \
    fonts-noto-cjk \
    gstreamer1.0-pulseaudio \
    gstreamer1.0-tools \
    libnugu \
    libnugu-plugins-default \
    libnugu-examples \
    libnugu-examples-qt \
    mdbus2 \
    nugud \
    pulseaudio \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080

ENV SHELL=/bin/bash
COPY startup.sh /usr/bin/
ENTRYPOINT ["/usr/bin/startup.sh"]
CMD ["/bin/bash"]

