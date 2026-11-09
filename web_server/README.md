# Web server

Bash scripts that configure an Ubuntu machine for the web server project. The checker runs them as root.

| File | What it does |
| --- | --- |
| `0-transfer_file` | Copies a file to a server home directory with `scp` |
| `1-install_nginx_web_server` | Installs Nginx and serves a page containing Holberton School |
| `3-redirection` | Adds a 301 redirect from `/redirect_me` |
| `4-not_found_page_404` | Adds a custom 404 page containing Ceci n'est pas une page |
| `5-design_a_beautiful_404_page.html` | The designed 404 page |

`2-setup_a_domain_name` is the root domain only, for example `myschool.tech`, after the A record points at web-01.
