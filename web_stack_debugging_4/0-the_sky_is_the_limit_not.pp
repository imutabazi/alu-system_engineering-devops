# Raises file descriptor limits for Nginx and restarts the service
exec { 'fix-nginx-ulimit':
  command => 'sed -i "s/worker_rlimit_nofile [0-9]*;/worker_rlimit_nofile 65536;/g" /etc/nginx/nginx.conf && grep -q "worker_rlimit_nofile" /etc/nginx/nginx.conf || sed -i "1i worker_rlimit_nofile 65536;" /etc/nginx/nginx.conf && (grep -q "65536" /etc/security/limits.conf || printf "* soft nofile 65536\n* hard nofile 65536\nroot soft nofile 65536\nroot hard nofile 65536\n" >> /etc/security/limits.conf) && (service nginx restart || service nginx reload || true)',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
}
