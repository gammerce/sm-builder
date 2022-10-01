FROM ubuntu:18.04

ARG BUILD_VERSION

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 wget vim inotify-tools curl

RUN useradd builder
USER builder

COPY compile.sh /tmp/compile.sh
COPY watch.sh /tmp/watch.sh

WORKDIR /tmp
RUN LATEST_VERSION=$( curl -s https://sm.alliedmods.net/smdrop/$BUILD_VERSION/sourcemod-latest-linux ) \
    && echo $LATEST_VERSION \
    && BUILD_URL="https://sm.alliedmods.net/smdrop/$BUILD_VERSION/$LATEST_VERSION" \
    && echo $BUILD_URL \
    && wget -O build.tar.gz "${BUILD_URL}"
RUN tar -xzf build.tar.gz

WORKDIR /tmp/addons/sourcemod/scripting
ENTRYPOINT ["/tmp/compile.sh"]
