from alpine:latest
MAINTAINER daniel@harrisbaird.co.uk

ENV RUNTIME_PACKAGES ca-certificates python py-pip libxslt libxml2
ENV BUILD_PACKAGES build-base libxslt-dev libxml2-dev libffi-dev python-dev openssl-dev

WORKDIR /scrapyd

RUN apk add --no-cache $RUNTIME_PACKAGES && \
    update-ca-certificates

ADD requirements.txt .

RUN apk --no-cache add --virtual build-dependencies $BUILD_PACKAGES && \
    pip --no-cache-dir install -r requirements.txt && \
    apk del build-dependencies

EXPOSE 6800
CMD ["scrapyd"]
