#apache
yum install httpd php

curl -kL https://ja.wordpress.org/wordpress-4.1.1-ja.tar.gz | tar
zxf - -C /tmp
mv /tmp/wordpress/* /var/www/html/.

yum install mariadb-server php-gd php-mbstring php-mysql php-pspell php-xml php-xmlpc
systemctl start mariadb
mysql -e "create database wp"
mysql -e "grant all on wp.*" tp wp@'localhost' identified by 'wp'"

systemctl start httpd

systemctl start nginx
curl http://example.com

