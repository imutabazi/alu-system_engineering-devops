# Raises Nginx file limits so ab -c 100 -n 1000 succeeds with 0 failures
exec { 'fix-nginx-limits':
  command => 'sed -i "s/worker_rlimit_nofile .*/worker_rlimit_nofile 65536;/" /etc/nginx/nginx.conf; service nginx restart || true',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
}
