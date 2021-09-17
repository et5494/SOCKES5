#!/bin/sh
yum install -y gcc openldap-devel pam-devel openssl-devel net-tools vim
wget http://jaist.dl.sourceforge.net/project/ss5/ss5/3.8.9-8/ss5-3.8.9-8.tar.gz
tar -vzx -f ss5-3.8.9-8.tar.gz
cd ss5-3.8.9/
./configure
make
make install
chmod a+x /etc/init.d/ss5
firewall-cmd --permanent --add-port=1080/tcp
firewall-cmd --reload
service firewalld restart
cd /etc/opt/ss5
rm -r -f ss5.conf
wget https://raw.githubusercontent.com/et5494/SOCKES5/main/ss5.conf
chmod a+x ss5.conf
wget https://raw.githubusercontent.com/et5494/SOCKES5/main/ss5.passwd
chmod a+x ss5.conf
useradd lo1
useradd lo2
useradd lo3
