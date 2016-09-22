FROM alpine:3.4
MAINTAINER Garrett Heaver <https://github.com/garrettheaver>

RUN apk update \
  && apk add alpine-sdk python \
  && curl -s https://bootstrap.pypa.io/get-pip.py | python \
  && pip install awscli

RUN printf "\n\n" | adduser -h /home/build build \
  && echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
  && addgroup build abuild

COPY ./entrypoint.sh /

USER build
ENTRYPOINT ["/entrypoint.sh"]

