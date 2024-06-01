
yum install httpd php -y
yum install gcc glibc glibc-common -y
yum install gd gd-devel -y

adduser -m nagios
passwd nagios
groupadd nagioscmd
usermod -a -G nagioscmd nagios
usermod -a -G nagioscmd apache

mkdir ~/downloads 
cd ~/downloads

wget 
wget https://nagios-plugins.org/download/nagios-plugins-2.4.8.tar.gz

tar -zxvf nagios-4.4.6.tar.gz
cd nagios-4.4.6

./configure --with-command-group=nagioscmd

make all
#/usr/bin/install -c -m 775 -o nagios -g nagcmd -d /usr/local/nagios/var/rw
#chmod g+s /usr/local/nagios/var/rw

make install
make install-init
make install-config
make install-commandmode

vim /usr/local/nagios/etc/objects/contacts.cfg

make install-webconf

htpasswd -c /usr/local/nagios/etc.htpasswd.users nagiosadmin

service httpd restart

cd ~/downloads
tar -zxvf nagios-plugins-2.4.8.tar.gz
cd nagios-plugins-2.4.8

./configure --with-nagios-user=nagios
./configure --with-nagios-groups=nagios

make
make install

chkconfig --add nagios
chkconfig nagios on
#[verify the sample nagios configuartion files]
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

service nagios start
service httpd restart
