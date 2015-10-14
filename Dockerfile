FROM alpine:edge
MAINTAINER mydancake@gmail.com

ENV RUNTIME_PACKAGES python py-pip libxslt libxml2
ENV BUILD_PACKAGES build-base libxslt-dev libxml2-dev libffi-dev python-dev openssl-dev

RUN apk add --update $RUNTIME_PACKAGES && rm -rf /var/cache/apk/*

RUN apk --update add $BUILD_PACKAGES && \
  pip --no-cache-dir install scrapyd && \
  apk del $BUILD_PACKAGES && \
  rm -rf /var/cache/apk/*

EXPOSE 6800
CMD ["scrapyd"]
