# Raises Nginx file and connection limits so ab -c 100 -n 1000 succeeds
exec { 'set-nginx-limits':
  command => 'sed -i "s/worker_connections [0-9]*;/worker_connections 4096;/; s/#*\\s*worker_rlimit_nofile .*/worker_rlimit_nofile 65536;/" /etc/nginx/nginx.conf',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
}

exec { 'restart-nginx-limits':
  command => '(grep -q "worker_rlimit_nofile" /etc/nginx/nginx.conf || sed -i "1i worker_rlimit_nofile 65536;" /etc/nginx/nginx.conf) && service nginx restart',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  require => Exec['set-nginx-limits'],
}
