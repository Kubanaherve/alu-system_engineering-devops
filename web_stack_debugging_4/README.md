# Web stack debugging #4

| File | What it does |
| --- | --- |
| `0-the_sky_is_the_limit_not.pp` | Puppet manifest that raises the open file limit of Nginx to 4096 and restarts it |

## The fault

`/etc/default/nginx` sets `ULIMIT="-n 15"`. The Nginx init script passes that value to `ulimit`, so Nginx may hold only 15 open files at a time. Each connection and each file it serves uses one, so 100 requests at a time run out almost at once and Nginx answers the rest with an error page.

## Finding it

Run the benchmark, then read the Nginx error log.

```bash
ab -c 100 -n 2000 localhost/
tail /var/log/nginx/error.log
```

The log repeats the same reason:

```text
open() "/usr/share/nginx/html/index.html" failed (24: Too many open files)
accept4() failed (24: Too many open files)
```

The limit of the running Nginx and the file that sets it:

```bash
grep 'open files' /proc/$(cat /run/nginx.pid)/limits
grep -n ULIMIT /etc/default/nginx
```

## Applying the fix

```bash
puppet apply 0-the_sky_is_the_limit_not.pp
ab -c 100 -n 2000 localhost/      # Failed requests: 0
```
