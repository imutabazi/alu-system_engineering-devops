# Load Balancer

Automation scripts for Nginx custom headers (`X-Served-By`) on `7113-web-01` and `7113-web-02` and HAProxy `roundrobin` load balancing on `7113-lb-01`.

## Servers

| Name | IP | Role |
| :--- | :--- | :--- |
| `7113-web-01` | `13.40.85.82` | Web server 1 |
| `7113-web-02` | `35.179.127.188` | Web server 2 |
| `7113-lb-01` | `16.60.113.174` | HAProxy load balancer |

## Files

* `0-custom_http_response_header`: Installs Nginx and adds `X-Served-By` set to `$hostname`.
* `1-install_load_balancer`: Installs HAProxy and configures `roundrobin` balancing to `7113-web-01` and `7113-web-02`.
