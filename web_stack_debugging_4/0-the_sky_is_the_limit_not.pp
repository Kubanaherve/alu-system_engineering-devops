# Raises the open file limit of Nginx so it stops failing requests under load

exec { 'fix--for-nginx':
  command  => 'sed -i \'/^[# ]*ULIMIT=/c ULIMIT="-n 4096"\' /etc/default/nginx && service nginx restart',
  provider => shell,
  path     => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
