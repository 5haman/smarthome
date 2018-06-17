FROM alpine:latest

RUN echo 'http://dl-5.alpinelinux.org/alpine/edge/main' >>/etc/apk/repositories \
    && apk -U --no-cache add mosquitto \
    && apk -U --no-cache -t .build-deps add curl \
    && curl -sSL https://github.com/just-containers/s6-overlay/releases/download/v1.21.4.0/s6-overlay-amd64.tar.gz \
	| tar -zx -C / \
    && apk del .build-deps \
    && rm -rf /root/.cache /tmp/* /usr/include

ADD rootfs /

ENTRYPOINT ["/init"]
