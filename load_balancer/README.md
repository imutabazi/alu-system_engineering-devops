# Load Balancer

Configuration and automation scripts for deploying a two-server Nginx web tier behind an HAProxy round-robin load balancer (`7113-web-01`, `7113-web-02`, and `7113-lb-01`).

## Infrastructure

| Server | Hostname | IP Address | Role |
| :--- | :--- | :--- | :--- |
| `web-01` | `7113-web-01` | `13.40.85.82` | Primary Nginx web server |
| `web-02` | `7113-web-02` | `35.179.127.188` | Secondary Nginx web server |
| `lb-01` | `7113-lb-01` | `16.60.113.174` | HAProxy load balancer (`roundrobin`) |

## Files

* `0-custom_http_response_header`: Installs Nginx, configures default pages and `/redirect_me`, and adds the custom `X-Served-By` HTTP response header set to `$hostname`.
* `1-install_load_balancer`: Installs HAProxy on `lb-01`, enables init-script management, and configures `roundrobin` HTTP load balancing across `7113-web-01` and `7113-web-02`.

## Usage

1. Run `sudo ./0-custom_http_response_header` on `7113-web-01` and `7113-web-02`.
2. Run `sudo ./1-install_load_balancer` on `7113-lb-01`.
3. Verify alternating `X-Served-By` headers with `curl -sI http://16.60.113.174 | grep X-Served-By`.
