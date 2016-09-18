FROM alpine:edge
MAINTAINER mydancake@gmail.com

ENV RUNTIME_PACKAGES python3 libxslt libxml2
ENV BUILD_PACKAGES build-base libxslt-dev libxml2-dev libffi-dev python3-dev openssl-dev
ENV PYTHON_PACKAGES scrapy scrapyd scrapyd-client w3lib scrapylib scrapyjs jmespath

RUN mkdir /scrapyd
WORKDIR /scrapyd

RUN apk add --update $RUNTIME_PACKAGES && \
  python3 -m ensurepip && \
  pip3 --no-cache-dir install --upgrade pip setuptools && \
  apk --update add $BUILD_PACKAGES && \
  pip3 --no-cache-dir install $PYTHON_PACKAGES && \
  apk del $BUILD_PACKAGES && \
  rm -rf /var/cache/apk/*

# Empty config file to ensure HttpCacheMiddleware gets loaded
RUN touch scrapy.cfg

EXPOSE 6800
CMD ["scrapyd"]
