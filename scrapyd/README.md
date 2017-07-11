[![](https://images.microbadger.com/badges/image/harrisbaird/scrapyd.svg)](https://microbadger.com/images/harrisbaird/scrapyd "Get your own image badge on microbadger.com")

---

# Run a Scrapyd service in Docker

A Scrapyd docker image based on the tiny [Alpine Linux](https://hub.docker.com/_/alpine/).

## Tags
* `py2`, `latest` [(Dockerfile)](https://github.com/harrisbaird/dockerfiles/blob/master/scrapyd/py2/Dockerfile)
* `py3` [(Dockerfile)](https://github.com/harrisbaird/dockerfiles/blob/master/scrapyd/py3/Dockerfile)

## Download and run Scrapyd image
    docker run -d --restart always --name scrapyd -p 6800:6800 harrisbaird/scrapyd

### !!!!!! WARNING !!!!!!
It's a bad idea to publicly expose a Scrapyd service without some form of authentication as anyone will be able access your spiders or even worse - run code on your server.

Instead you should either:
* Deploy directly during the docker build process and link the containers which require access to Scrapyd.
* Expose Scrapyd via something like Nginx with basic auth enabled. You can then add the username and password to your `scrapy.cfg` and then deploy with `scrapyd-deploy`.

## Uploading spiders to Scrapyd
Install [scrapyd-client](https://github.com/scrapy/scrapyd-client) and use `scrapyd-deploy` in your spider directory to package it up and upload it to Scrapyd.

You'll need to add some config to your project's `scrapy.cfg` file, take a look at [scrapyd-client](https://github.com/scrapy/scrapyd-client) for more info.

## Uploading spiders during docker build process
You can deploy your spiders directly to Scrapyd during the docker build process.  
This way you can just link to the container instead of publicly exposing your Scrapyd service.

```dockerfile
FROM harrisbaird/scrapyd:latest

RUN mkdir /app
WORKDIR /app

COPY . /app

RUN scrapyd & PID=$! && \
   echo "Waiting for Scrapyd to start" && \
   sleep 2 && \
   scrapyd-deploy && \
   kill $PID
```

## Scheduling a job
    curl http://localhost:6800/schedule.json -d project=default -d spider=my_spider_name

## Listing all jobs
    curl http://localhost:6800/listjobs.json -d project=default

For a full list of endpoints, take a look at the [Scrapyd docs](https://scrapyd.readthedocs.io/en/stable/).

## External links

[scrapy](http://scrapy.readthedocs.org/en/latest/): The web crawling framework itself  
[scrapyd](http://scrapyd.readthedocs.org/en/latest/): Service for running multiple scrapy spiders concurrently, controlled with a JSON API.   
[scrapyd-client](https://github.com/scrapy/scrapyd-client) Deploy projects to your Scrapyd server.
