# Fixes the .phpp typo in WordPress files under /var/www/html so Apache serves HTTP 200
exec { 'fix-wordpress':
  command => 'sed -i "s/\\.phpp/.php/g" /var/www/html/wp-settings.php && find /var/www/html -type f -name "*.php" -exec sed -i "s/\\.phpp/.php/g" {} + && (service apache2 restart || apache2ctl graceful || true)',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
}
