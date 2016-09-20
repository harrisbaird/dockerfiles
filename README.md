[![](https://images.microbadger.com/badges/image/harrisbaird/scrapyd.svg)](https://microbadger.com/images/harrisbaird/scrapyd "Get your own image badge on microbadger.com")

---

# Run a scrapyd service in Docker

A scrapyd docker image based on the tiny [Alpine Linux](https://hub.docker.com/_/alpine/).

## Tags
* `py-2.7`, `latest` [(Dockerfile)](https://github.com/harrisbaird/docker-scrapyd/blob/master/py2.7/Dockerfile)
* `py-3.5` [(Dockerfile)](https://github.com/harrisbaird/docker-scrapyd/blob/master/py3.5/Dockerfile)

## Download and run scrapyd image
    docker run -d --restart always --name scrapyd -p 6800:6800 harrisbaird/scrapyd

## Uploading spiders to scrapyd
Install [scrapyd-client](https://github.com/scrapy/scrapyd-client) and use `scrapyd-deploy` in your spider directory to package it up and upload it to scrapyd.

You'll need to add some config to your project's `scrapy.cfg` file, take a look at scrapyd-client for more info.

## Scheduling a job
    curl http://127.0.0.1:6800/schedule.json -d project=default -d spider=my_spider_name

## Getting status of the job
    curl http://127.0.0.1:6800/listjobs.json -d project=default

or use the Web UI [http://127.0.0.1:6800/](http://127.0.0.1:6800/)

## External links

[scrapy](http://scrapy.readthedocs.org/en/latest/): The web crawling framework itself  
[scrapyd](http://scrapyd.readthedocs.org/en/latest/): Service for running multiple scrapy spiders concurrently, controlled with a JSON API.   
[scrapyd-client](https://github.com/scrapy/scrapyd-client) Deploy projects to your scrapyd server.
