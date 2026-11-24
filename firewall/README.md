# Firewall

`ufw` firewall rules blocking incoming traffic by default on `7113-web-01` (`13.40.85.82`) while allowing TCP ports `22` (SSH), `443` (HTTPS SSL), and `80` (HTTP).

## Files

* `0-block_all_incoming_traffic_but`: `ufw` commands to install/configure `ufw`, deny incoming traffic by default, allow TCP ports `22`, `80`, and `443`, and enable the firewall.
