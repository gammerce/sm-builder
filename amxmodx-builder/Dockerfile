FROM ubuntu:18.04

ARG BUILD_URL

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 wget vim unzip inotify-tools

RUN useradd -m builder
USER builder

RUN mkdir /home/builder/sources

COPY ./compile.sh /home/builder/compile.sh
COPY ./watch.sh /home/builder/watch.sh

WORKDIR /home/builder
RUN wget -O build.tar.gz "${BUILD_URL}"
RUN tar -xzf build.tar.gz

WORKDIR /home/builder/addons/amxmodx/scripting
ENTRYPOINT ["/home/builder/compile.sh"]
