# Load balancer

| File | What it does |
| --- | --- |
| `0-custom_http_response_header` | Installs Nginx and adds the response header `X-Served-By` with the server hostname |
| `1-install_load_balancer` | Installs HAProxy, enables its init script, and balances web-01 and web-02 with roundrobin |

`1-install_load_balancer` balances `18.170.27.208` and `13.40.151.56` with roundrobin.
