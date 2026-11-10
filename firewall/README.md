# Firewall

| File | What it does |
| --- | --- |
| `0-block_all_incoming_traffic_but` | Installs `ufw`, blocks all incoming traffic, and allows only TCP ports 22 (SSH), 443 (HTTPS) and 80 (HTTP) |

Port 22 is allowed before the firewall is enabled, so the SSH session that runs the script is not cut off.
