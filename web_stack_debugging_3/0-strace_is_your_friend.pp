# Fixes .phpp typo in WordPress so Apache serves HTTP 200
exec { 'fix-wordpress':
  command => 'sed -i "s/\\.phpp/.php/g" /var/www/html/wp-settings.php && service apache2 restart',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
}
