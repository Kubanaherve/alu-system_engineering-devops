# Web stack debugging #1

| File | What it does |
| --- | --- |
| `0-nginx_likes_port_80` | Changes the enabled Nginx site from port 8080 to port 80 and restarts Nginx |

## The fault

The site in `/etc/nginx/sites-enabled/default` listens on port 8080, so nothing answers on port 80 and `curl 0:80` is refused.

## Commands to see it

```bash
curl 0:80                                         # Connection refused
service nginx status
netstat -lnt                                      # shows :8080, not :80
grep -n listen /etc/nginx/sites-enabled/default   # listen 8080
nginx -t
```

After the script, `curl 0:80` returns the "Welcome to nginx!" page.
