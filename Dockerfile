FROM ubuntu:focal
LABEL maintainer="Yuri Tsuprun" \
      architecture="amd64/x86_64" \
      org.opencontainers.image.title="cloudcli" \
      org.opencontainers.image.authors="Yuri Tsuprun <yuri.tsuprun@omc.co.il>" \
      org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.created=$BUILD_DATE

ARG DEBIAN_FRONTEND=noninteractive

RUN set -ex && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    curl jq tar bzip2 gzip ca-certificates && \
    curl https://cloudcli.cloudwm.com/binaries/latest/cloudcli-linux-amd64.tar.gz | tar -xz && \
    chmod +x cloudcli && \
    mv cloudcli /usr/local/bin && \
    apt-get autoclean autoremove
