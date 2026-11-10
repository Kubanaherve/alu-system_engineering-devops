# Web stack debugging #2

| File | What it does |
| --- | --- |
| `0-iamsomeoneelse` | Runs `whoami` as the user given as the first argument |
| `1-run_nginx_as_nginx` | Makes Nginx run as the `nginx` user and listen on port 8080 |

## 0-iamsomeoneelse

```bash
./0-iamsomeoneelse www-data    # prints www-data
```

`sudo -u USER COMMAND` runs one command as another user. The shell that called the script stays root.

## 1-run_nginx_as_nginx

What stops Nginx from running as `nginx` on port 8080, and the line that deals with each:

| Problem | Fix |
| --- | --- |
| Nginx is running as root | `service nginx stop` |
| Apache already holds port 8080 | `pkill apache2` |
| `nginx.conf` is readable by root only | `chmod 644 /etc/nginx/nginx.conf` |
| The `user` line names another user or is commented out | `sed` sets it to `user nginx;` |
| The site listens on port 80, which only root may open | `sed` changes `listen 80` to `listen 8080` |
| The `nginx` user cannot write the pid file, the logs, or its working directory | `touch` and `chown` |

The last line starts Nginx as the `nginx` user, so the master process is owned by `nginx` too.

Check the result:

```bash
ps auxff | grep ngin[x]
nc -z 0 8080 ; echo $?
```
