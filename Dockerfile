FROM alpine:latest

RUN apk update && \
    apk add make --no-cache && \
    apk add librsvg --no-cache && \
    apk add graphicsmagick --no-cache && \
    apk add pngquant --no-cache

WORKDIR /usr/local/
