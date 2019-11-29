sudo yum localinstall -y http://nginx.org/packages/centos7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
sudo yum install -y nginx
systemctl status nginx
systemctl status nginx
sudo systemctl start nginx
sudo systemctl stop nginx
sudo systemctl restart nginx
systemctl is-enabled nginx
sudo systemctl enable nginx
systemctl is-enabled nginx
curl http://192.168.33.10


cat /etc/nginx/nginx.conf
cat /etc/nginx/conf.d/default.conf
cat /usr/share/nginx/html/index.html


openssl version
sudo yum install -y openssl
sudo mkdir /etc/nginx/ssl
sudo openssl genrsa -out /etc/nginx/ssl/server.key 2048
sudo openssl req -new -key /etc/nginx/ssl/server.keyy -out
sudo openssl x509 -days -out /etc/nginx/ssl/server.crt
ls -l /etc/nginx/ssl/
sudo vi /etc/nginx/conf.d/training_app.conf
sudo systemctl restart nginx
curl https://192.168.33.10


