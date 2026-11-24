# Raises Nginx file and connection limits for 1000 requests at 100 concurrency
exec { 'fix-nginx-limits':
  command => [
    '/bin/sh',
    '-c',
    'sed -i "s/worker_connections [0-9]*;/worker_connections 4096;/" /etc/nginx/nginx.conf && sed -i "s/#*[[:space:]]*worker_rlimit_nofile .*/worker_rlimit_nofile 65536;/" /etc/nginx/nginx.conf && (grep -q "worker_rlimit_nofile" /etc/nginx/nginx.conf || sed -i "1i worker_rlimit_nofile 65536;" /etc/nginx/nginx.conf) && ([ -f /etc/default/nginx ] && sed -i "s/#*[[:space:]]*ULIMIT=.*/ULIMIT=\\"-n 65536\\"/" /etc/default/nginx || true) && service nginx restart',
  ],
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
}
