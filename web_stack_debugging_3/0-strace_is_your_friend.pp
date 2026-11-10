# Fixes the wrong file extension in wp-settings.php that makes Apache return a 500

exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  onlyif  => 'grep -q phpp /var/www/html/wp-settings.php',
  path    => '/usr/local/bin:/usr/bin:/bin',
}
