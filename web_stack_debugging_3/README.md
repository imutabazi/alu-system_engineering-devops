# Web Stack Debugging #3

Puppet manifest (`0-strace_is_your_friend.pp`) fixing the `.phpp` typo causing Apache to return HTTP 500 on WordPress.

## Files

* `0-strace_is_your_friend.pp`: Replaces `.phpp` file extensions with `.php` under `/var/www/html` and ensures Apache is running.
