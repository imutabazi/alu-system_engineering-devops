# Web Stack Debugging #2

Scripts for running commands as another user (`0-iamsomeoneelse`) and configuring Nginx to run as the `nginx` user on port `8080` (`1-run_nginx_as_nginx`).

## Files

* `0-iamsomeoneelse`: Executes `whoami` under the user passed as the first argument.
* `1-run_nginx_as_nginx`: Configures Nginx to run as user `nginx` and listen on port `8080` across active IPs without `apt-get remove`.
