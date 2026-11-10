# Web stack debugging #0

| File | What it does |
| --- | --- |
| `0-give_me_a_page` | Starts Apache in the `holbertonschool/265-0` container so `/` returns `Hello Holberton` |

## What was wrong

Apache was installed, its configuration was valid, and `/var/www/html/index.html` already held `Hello Holberton`. The service was not running, so nothing listened on port 80 and `curl` got no reply.

## How it was found

```bash
ps aux                    # only /bin/bash, no apache2
service apache2 status    # apache2 is not running
netstat -lnt              # nothing on port 80
apache2ctl configtest     # Syntax OK
cat /var/www/html/index.html
```
