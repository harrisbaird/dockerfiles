FROM alpine:edge
MAINTAINER mydancake@gmail.com

ENV RUNTIME_PACKAGES python3 libxslt libxml2
ENV BUILD_PACKAGES build-base libxslt-dev libxml2-dev libffi-dev python3-dev openssl-dev libffi-dev git
ENV PYTHON_PACKAGES scrapy w3lib scrapylib scrapyjs jmespath

RUN mkdir /scrapyd
WORKDIR /scrapyd

RUN apk add --update $RUNTIME_PACKAGES $BUILD_PACKAGES && \
  python3 -m ensurepip && \
  pip3 --no-cache-dir install --upgrade pip setuptools $PYTHON_PACKAGES \
  git+https://github.com/redapple/scrapyd-client.git@py3-support \
  git+https://github.com/redapple/scrapyd.git@py3-web-resources && \
  apk del $BUILD_PACKAGES && \
  rm -rf /var/cache/apk/*

# Empty config file to ensure HttpCacheMiddleware gets loaded
RUN touch scrapy.cfg

EXPOSE 6800
CMD ["scrapyd"]
