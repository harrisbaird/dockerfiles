FROM harrisbaird/docker:latest

RUN wget -O /usr/local/bin/tinycron https://github.com/bcicen/tinycron/releases/download/v0.4/tinycron-0.4-linux-amd64 && \
    chmod +x /usr/local/bin/tinycron

ADD docker-entrypoint.sh docker-entrypoint.sh

ENTRYPOINT ["sh", "docker-entrypoint.sh"]
