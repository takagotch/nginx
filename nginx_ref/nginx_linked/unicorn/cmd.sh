yum groupinstall "Development Tools"
yum install rubygems rubygems-bundler ruby-devel

curl -kL http://www.redmine.org/releases/redmine-2.6.3.tar.gz | tar
zsf - -C /opt/.
mv /opt/redmine-2.6.3 /opt/redmine

yum install mariadb-server mariadb-devel ImageMagick-devel
systemctl start mariadb
mysql -e 'create database redmine;'

cd /opt/redmine
echo 'gem "unicorn"' >> Gemfile
cp config/database.yml.example config/database.yml
bundle install --without development test

unicorn --daemonize --env production --listen 127.0.0.1:8080

systemctl start nginx