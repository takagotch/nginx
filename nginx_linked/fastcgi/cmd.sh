crul -kL https://ja.wordpress.org/wordpress-4.1.1-ja.tar.gz | tar
zxf - -C /opt/.

yum install mariadb-server php-gd php-gd php-mbstring php-mysql php-pspell php-xml php-xmlrpc
systemctl start mariadb
mysql -e "create database wp"
mysql -e "grant all on wp.* to wp@'localhost' identified by 'wp'"

yum install php-fpm

systemctl start php-fpm
systemctl start nginx