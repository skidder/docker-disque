FROM ubuntu:latest

RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN buildDeps='gcc libc6-dev make git ca-certificates'; \
    set -x \
    && apt-get update \
    && apt-get install -y $buildDeps --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /usr/src \
    && cd /usr/src \
    && git clone https://github.com/antirez/disque.git \
    && cd disque \
    && git checkout tags/1.0-rc1 \
    && make -C /usr/src/disque \
    && make -C /usr/src/disque install \
    && rm -rf /usr/src/disque \
    && apt-get purge -y --auto-remove $buildDeps

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD [ "disque-server" ]

# Expose ports.
EXPOSE 7711
