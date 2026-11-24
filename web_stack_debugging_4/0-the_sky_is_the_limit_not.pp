# Raises Nginx's open-file limit so ab -c 100 -n 1000 has 0 failed requests
exec { 'fix--for-nginx':
  command  => 'sed -i "s/^ULIMIT=.*/ULIMIT=\"-n 4096\"/" /etc/default/nginx; service nginx restart',
  path     => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  provider => shell,
}
