FROM alpine:latest AS build

ENV XMRIG_VERSION="6.6.1"

WORKDIR /build

RUN apk --no-cache upgrade && \
    apk add --no-cache wget && \
    wget https://github.com/xmrig/xmrig/releases/download/v$XMRIG_VERSION/xmrig-$XMRIG_VERSION-linux-static-x64.tar.gz && \
    tar xzvf xmrig-$XMRIG_VERSION-linux-static-x64.tar.gz --strip-components=1 && \
    grep xmrig SHA256SUMS | sha256sum -c -

FROM alpine:latest

VOLUME /mine/config.json

WORKDIR /mine

COPY --from=build /build/xmrig ./xmrig

ENTRYPOINT ./xmrig -c /mine/config.json

