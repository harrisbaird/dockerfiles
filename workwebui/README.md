[![](https://images.microbadger.com/badges/image/harrisbaird/workwebui.svg)](https://microbadger.com/images/harrisbaird/workwebui "Get your own image badge on microbadger.com")

---

# Gocraft/Work Web UI

Small alpine image for the [gocraft/work](https://github.com/gocraft/work) web ui.

Be sure to set the `REDIS_NAMESPACE` environment variable and optionally `REDIS_HOST`.

```bash
docker run -e REDIS_NAMESPACE=MyRedisNamespace -it harrisbaird/webworkui
```
