# Web Server

Nginx web server configuration scripts and domain setup for `mutabazi.tech` (`7113-web-01` at `13.40.85.82`).

## Files

* `2-setup_a_domain_name`: Contains the registered domain name (`mutabazi.tech`) with its root `A` record pointing to `13.40.85.82`.

## Verification

```bash
cat 2-setup_a_domain_name
dig mutabazi.tech +short
```
