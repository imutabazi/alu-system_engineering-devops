# Raises Nginx connection and file limits under 140-char line limit
exec { 'fix-nginx-limits':
  command => '/bin/bash -c "sed -i \"s/worker_connections [0-9]*;/worker_connections 4096;/\" /etc/nginx/nginx.conf && sed -i \"s/#*\\s*worker_rlimit_nofile .*/worker_rlimit_nofile 65536;/\" /etc/nginx/nginx.conf && (grep -q \"worker_rlimit_nofile\" /etc/nginx/nginx.conf || sed -i \"1i worker_rlimit_nofile 65536;\" /etc/nginx/nginx.conf) && ([ -f /etc/default/nginx ] && sed -i \"s/#*\\s*ULIMIT=.*/ULIMIT=\\\"-n 65536\\\"/\" /etc/default/nginx || true) && (service nginx restart || true)"',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
}
