FROM alpine:latest

ENV NODE_ENV=production

RUN apk -U --no-cache add nodejs \
    && apk -U --no-cache -t .build-deps add \
	curl python nodejs-npm paxctl build-base \
    && paxctl -cm $(which node) \
    && npm install --unsafe-perm -g \
	homebridge \
	homebridge-knx \
	homebridge-config-ui-x \
	homebridge-weather \
	homebridge-mqtt \
	homebridge-punt \
    && curl -sSL https://github.com/just-containers/s6-overlay/releases/download/v1.21.4.0/s6-overlay-amd64.tar.gz \
	| tar -zx -C / \
    && apk del .build-deps \
    && sed -i 's#newsAccessory.reachable = true;#//newsAccessory.reachable = true;#g' /usr/lib/node_modules/homebridge-punt/index.js \
    && find /usr/lib/node_modules -type f | grep -vE '\.conf$|\.css$|\.env$|\.gif$|\.gyp$|\.gypi$|\.html$|\.ico$|\.jpg$|\.js$|\.json$|\.lock$|\.map$|\.node$|\.png$|\.settings$|\.sh$|\.svg$|\.ttf$|\.woff$|\.woff2$|\.xml$|\.yml$|homebridge$' | xargs rm -f \
    && rm -rf /root/.cache /root/.node-gyp /root/.npm /tmp/* /usr/include

ADD rootfs /
ADD config/config.json /root/.homebridge/config.json
ADD config/knx_config.json /root/.homebridge/knx_config.json

ENTRYPOINT ["/init"]
