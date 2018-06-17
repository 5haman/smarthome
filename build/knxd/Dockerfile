FROM alpine:latest

RUN apk -U --no-cache add libusb libev libstdc++ \
    && apk -U --no-cache -t .build-deps add \
	build-base abuild git libev-dev automake autoconf dev86 \
	libtool argp-standalone linux-headers libusb-dev cmake curl \ 
    && git clone --depth 1 https://github.com/knxd/knxd.git /tmp/knxd \
    && cd /tmp/knxd \
    && ./bootstrap.sh \
    && ./configure --disable-systemd --enable-eibnetip --enable-eibnetserver --enable-eibnetiptunnel \
    && mkdir -p src/include/sys && ln -s /usr/lib/bcc/include/sys/cdefs.h src/include/sys \
    && make && make install \
    && curl -sSL https://github.com/just-containers/s6-overlay/releases/download/v1.21.4.0/s6-overlay-amd64.tar.gz \
	| tar -zx -C / \
    && apk del .build-deps \
    && rm -rf /root/.cache /tmp/* \
	/usr/local/share /usr/local/libexec /usr/local/include /usr/include

ADD rootfs /
ADD config/knxd.ini /etc/knxd/knxd.ini

ENTRYPOINT ["/init"]
