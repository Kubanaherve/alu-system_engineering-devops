# Web stack debugging #3

| File | What it does |
| --- | --- |
| `0-strace_is_your_friend.pp` | Puppet manifest that corrects the file extension in `/var/www/html/wp-settings.php` so WordPress loads again |

## The fault

`wp-settings.php` asks PHP to load `wp-includes/class-wp-locale.phpp`. The real file is `class-wp-locale.php`. PHP cannot open the misspelled name, stops with a fatal error, and Apache answers `500 Internal Server Error`.

## Finding it with strace

Attach `strace` to the running Apache processes in one window, then request the page from another.

```bash
# window 1
strace -f $(pgrep apache2 | sed 's/^/-p /') -e trace=file -o /tmp/strace.out

# window 2
curl -sI 127.0.0.1

# window 1, after Ctrl+C
grep ENOENT /tmp/strace.out | grep /var/www
```

The trace shows the file PHP tried and failed to open:

```text
open("/var/www/html/wp-includes/class-wp-locale.phpp", O_RDONLY) = -1 ENOENT (No such file or directory)
```

`grep -rn phpp /var/www/html` then points to the line in `wp-settings.php`.

## Applying the fix

```bash
puppet apply 0-strace_is_your_friend.pp
curl -sI 127.0.0.1      # HTTP/1.1 200 OK
```
