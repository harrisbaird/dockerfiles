FROM alpine:edge
MAINTAINER mydancake@gmail.com

ENV RUNTIME_PACKAGES python py-pip libxslt libxml2
ENV BUILD_PACKAGES build-base libxslt-dev libxml2-dev libffi-dev python-dev openssl-dev
ENV PYTHON_PACKAGES scrapy scrapyd scrapyd-client w3lib scrapylib scrapyjs jmespath

RUN mkdir /scrapyd
WORKDIR /scrapyd

RUN apk add --update $RUNTIME_PACKAGES && rm -rf /var/cache/apk/*

RUN apk --update add $BUILD_PACKAGES && \
  pip --no-cache-dir install $PYTHON_PACKAGES && \
  apk del $BUILD_PACKAGES && \
  rm -rf /var/cache/apk/*

# Empty config file to ensure HttpCacheMiddleware gets loaded
RUN touch scrapy.cfg

EXPOSE 6800
CMD ["scrapyd"]
