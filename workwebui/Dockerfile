FROM golang:alpine

RUN apk --no-cache add --virtual build-dependencies git && \
    go get github.com/gocraft/work/cmd/workwebui && \
    go install github.com/gocraft/work/cmd/workwebui && \
    apk del build-dependencies

COPY entrypoint.sh /

EXPOSE 8080
CMD ["sh", "/entrypoint.sh"]
