[![](https://images.microbadger.com/badges/image/harrisbaird/docker-cron.svg)](https://microbadger.com/images/harrisbaird/docker-cron "Get your own image badge on microbadger.com")

---

# Docker Cron

Run a docker command at a scheduled interval using [tinycron](https://github.com/bcicen/tinycron).

```bash
docker run \
-e COMMAND="docker run -rm hello-world" \
-e SCHEDULE="@daily" \
-e TINYCRON_VERBOSE="true" \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
harrisbaird/docker-cron
```

This runs the [hello-world](https://hub.docker.com/_/hello-world/) image daily.   
Use `TINYCRON_VERBOSE` to display the next scheduled time and cron output. 

```
[tinycron] next job scheduled for 2016-11-11 16:00:00 +0000 UTC
```
