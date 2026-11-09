# Load balancer

| File | What it does |
| --- | --- |
| `0-custom_http_response_header` | Installs Nginx and adds the response header `X-Served-By` with the server hostname |
| `1-install_load_balancer` | Installs HAProxy, enables its init script, and balances web-01 and web-02 with roundrobin |

`1-install_load_balancer` needs the public address of `7329-web-02` in place of `WEB02_IP` before it is run on `lb-01`.
