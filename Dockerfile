FROM alpine:latest

RUN apk update && \
    apk add imagemagick --no-cache && \
    apk add pngquant --no-cache

WORKDIR /usr/local/
