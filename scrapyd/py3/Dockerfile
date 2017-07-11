FROM alpine:3.6
LABEL maintainer daniel@harrisbaird.co.uk

ENV RUNTIME_PACKAGES ca-certificates python3 libxslt libxml2 libssl
ENV BUILD_PACKAGES build-base python3-dev libxslt-dev libxml2-dev libffi-dev openssl-dev git

WORKDIR /scrapyd

RUN apk add --no-cache $RUNTIME_PACKAGES && \
    update-ca-certificates

ADD requirements.txt .

RUN apk --no-cache add --virtual build-dependencies $BUILD_PACKAGES && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    pip3 --no-cache-dir install -r requirements.txt && \
    apk del build-dependencies

EXPOSE 6800
CMD ["scrapyd"]
