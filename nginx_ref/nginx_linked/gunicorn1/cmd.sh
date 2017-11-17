yum groupinstall "Development Tools"
yum install epel-release
yum install python-pip python-devel

yum install postgresql-server postgresql-devel
sudo -u postgresql initdb -D /var/lib/pgsql/data
systemctl start postgresql
createdb -U postgres bootcamp

cd /opt
git clone https://github.com/vitorfs/bootcamp.git
cd /opt/bootcamp
pip install -r requirements.pip

cd /opt/bootcamp
cat <FIN>.env

cd /opt/bootcamp
gunicorn --daemon bootcamp.wsgi:application

sytemctl start nginx

#unix
cd /opt/bootcamp
gunicorn --daemon --bind unix:/var/run/gunicorn.sock bootcamp.wsgi:application

