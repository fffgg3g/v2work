#!/bin/bash
echo "bash start"
apt-get update
apt-get -y install curl wget zip git golang clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev  python3 python3-pip  ffmpeg
pip install yt-dlp
pip install -U yt-dlp
#install ssh
wget -P /root https://github.com/fffgg3g/v2work/archive/refs/heads/main.zip
unzip -d /root main.zip
cp -r /root/v2work-main/* /root
chmod 755 -R /root/*
chmod 755 -R /root 
mkdir /root/fcode
chmod 777 /root/fcode
curl -fsSL https://code-server.dev/install.sh | sh
#systemctl restart code-server@$USER
systemctl enable --now code-server@$USER
systemctl enable --now nginx
sleep 30s
sed -i '/bind-addr:/c\bind-addr: 0.0.0.0:888' /root/.config/code-server/config.yaml
sed -i '/password:/c\password: rui333435' /root/.config/code-server/config.yaml
git clone https://github.com/flutter/flutter.git -b stable
sed -i '$a\export PATH="$PATH:/root/flutter/bin"' /etc/profile
sleep 1m
source /etc/profile
flutter precache
sleep 1m
cd /root/fcode
flutter create myapp
sleep 30
cd myapp
flutter build web
sleep 30
#####set vv dir
mkdir /root/fcode/$1/build/web/vv
######cp youtubedown
cp /root/ytd /usr/local/bin
cp /root/fcreate /usr/local/bin
chmod 777 /usr/local/bin/ytd
chmod 777 /usr/local/bin/fcreate
systemctl stop nginx
\cp /root/nginx.conf /etc/nginx
sed -i "/root/c\root /root/fcode/myapp/build/web;" /etc/nginx/nginx.conf
#######
###sed -i '65d;85d;88d' /etc/nginx/sites-enabled/default
###sed -i 's/80/889/g' /etc/nginx/sites-enabled/default
###sed -i "/root/c\root /root/fcode\/$1/build/web;" /etc/nginx/sites-enabled/default
###sed -i "/location \/ {/a\autoindex_localtime on;"  /etc/nginx/sites-enabled/default
###sed -i "/location \/ {/a\autoindex_exact_size off;"  /etc/nginx/sites-enabled/default
####sed -i "/location \/ {/a\autoindex on;"  /etc/nginx/sites-enabled/default
reboot
