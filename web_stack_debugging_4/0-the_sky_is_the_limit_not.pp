# Raises Nginx connection and file limits so ab -c 100 -n 1000 has 0 failures
exec { 'set-worker-connections':
  command => 'sed -i "s/worker_connections .*/worker_connections 4096;/" /etc/nginx/nginx.conf',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
}

exec { 'set-worker-rlimit':
  command => 'sed -i "s/.*worker_rlimit_nofile.*/worker_rlimit_nofile 65536;/" /etc/nginx/nginx.conf',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  require => Exec['set-worker-connections'],
}

exec { 'add-worker-rlimit':
  command => 'grep -q "worker_rlimit_nofile" /etc/nginx/nginx.conf || sed -i "1i worker_rlimit_nofile 65536;" /etc/nginx/nginx.conf',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  require => Exec['set-worker-rlimit'],
}

exec { 'set-soft-limit':
  command => 'grep -q "soft nofile 65536" /etc/security/limits.conf || echo "* soft nofile 65536" >> /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  require => Exec['add-worker-rlimit'],
}

exec { 'set-hard-limit':
  command => 'grep -q "hard nofile 65536" /etc/security/limits.conf || echo "* hard nofile 65536" >> /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  require => Exec['set-soft-limit'],
}

exec { 'restart-nginx':
  command => '(service nginx stop || true); pkill -9 nginx 2>/dev/null || true; service nginx start',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  require => Exec['set-hard-limit'],
}
