exec { 'fix-wordpress':
  command => 'find /var/www/html -type f -name "*.php" -exec sed -i "s/\.phpp'/.php'/g; s/\.phpp\"/\.php\"/g" {} + && (service apache2 restart || true)',
  path    => [ '/bin', '/usr/bin', '/sbin', '/usr/sbin' ],
}
