FROM alpine:edge
MAINTAINER daniel@harrisbaird.co.uk

ENV RUNTIME_PACKAGES ca-certificates python py2-pip libxslt libxml2
ENV BUILD_PACKAGES build-base libxslt-dev libxml2-dev libffi-dev python-dev openssl-dev
ENV PYTHON_PACKAGES scrapy scrapyd==1.1.0 scrapyd-client w3lib scrapylib scrapyjs jmespath

RUN mkdir /scrapyd
WORKDIR /scrapyd

RUN apk add --update $RUNTIME_PACKAGES && \
  apk --update add $BUILD_PACKAGES && \
  update-ca-certificates && \
  pip --no-cache-dir install $PYTHON_PACKAGES && \
  apk del $BUILD_PACKAGES && \
  rm -rf /var/cache/apk/*

# Empty config file to ensure HttpCacheMiddleware gets loaded
RUN touch scrapy.cfg

EXPOSE 6800
CMD ["scrapyd"]
