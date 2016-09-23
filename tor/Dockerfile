FROM container4armhf/armhf-alpine:3.4
MAINTAINER Garrett Heaver <https://github.com/garrettheaver>

RUN apk update \
  && apk add curl \
  && curl -Os https://s3-eu-west-1.amazonaws.com/daft-cluster/apk/community/armhf/tor-0.2.8.7-r1.apk \
  && apk add --allow-untrusted tor-0.2.8.7-r1.apk \
  && rm tor-0.2.8.7-r1.apk

COPY ./entrypoint.sh /

USER tor
EXPOSE 9050
ENTRYPOINT ["/entrypoint.sh"]

