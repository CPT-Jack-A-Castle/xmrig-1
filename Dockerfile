FROM alpine:latest AS build

ENV XMRIG_VERSION="6.6.1"

WORKDIR /mine

RUN apk --no-cache upgrade && \
    apk add --no-cache wget && \
    wget https://github.com/xmrig/xmrig/releases/download/v$XMRIG_VERSION/xmrig-$XMRIG_VERSION-linux-static-x64.tar.gz && \
    tar xzvf xmrig-$XMRIG_VERSION-linux-static-x64.tar.gz --strip-components=1 && \
    grep xmrig SHA256SUMS | sha256sum -c -

FROM alpine:latest

RUN adduser --disabled-password miner && \
    mkdir -p /mine && \
    chown -R miner:miner /mine

VOLUME /config

WORKDIR /mine

USER miner

COPY --chown=miner:miner --from=build /mine/xmrig ./xmrig

ENTRYPOINT "./xmrig" 

CMD ["-c /config/*.json"]
