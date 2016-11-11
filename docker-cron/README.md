# Docker Cron

Run a docker command at a scheduled interval using [tinycron](https://github.com/bcicen/tinycron).

```bash
docker run \
-e COMMAND="docker run hello-world" \
-e SCHEDULE="@daily" \
-e TINYCRON_VERBOSE="true" \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
harrisbaird/docker-cron
```

```
[tinycron] next job scheduled for 2016-11-11 16:00:00 +0000 UTC
```
