FROM ubuntu:18.04

ARG BUILD_URL

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 wget vim inotify-tools

RUN useradd builder
USER builder

COPY compile.sh /tmp/compile.sh
COPY watch.sh /tmp/watch.sh

WORKDIR /tmp
RUN wget -O build.tar.gz "${BUILD_URL}"
RUN tar -xzf build.tar.gz

WORKDIR /tmp/addons/sourcemod/scripting
ENTRYPOINT ["/tmp/compile.sh"]