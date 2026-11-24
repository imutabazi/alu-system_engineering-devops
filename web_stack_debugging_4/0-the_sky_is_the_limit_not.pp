# Increases Nginx open file and connection limits so ab -c 100 -n 1000 has 0 failures
exec { 'fix-nginx-limits':
  command => '/bin/bash -c "sed -i \"s/worker_rlimit_nofile [0-9]*;/worker_rlimit_nofile 65536;/g\" /etc/nginx/nginx.conf && grep -q \"worker_rlimit_nofile\" /etc/nginx/nginx.conf || sed -i \"1i worker_rlimit_nofile 65536;\" /etc/nginx/nginx.conf && sed -i \"s/worker_connections [0-9]*;/worker_connections 4096;/g\" /etc/nginx/nginx.conf && (grep -q \"nofile 65536\" /etc/security/limits.conf || printf \"* soft nofile 65536\n* hard nofile 65536\n\" >> /etc/security/limits.conf) && ulimit -n 65536 2>/dev/null || true && (service nginx reload || service nginx restart || (pkill nginx; nginx))"',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
}
