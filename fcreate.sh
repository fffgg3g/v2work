#!/bin/bash
echo 'create app'
flutter precache
cd /root/fcode
flutter create $1
sleep 30
cd $1
flutter build web
sleep 30
mkdir /root/fcode/$1/build/web/vv
echo "\cp /root/fcode/$1/build/app/outputs/apk/release/*.apk /root/fcode/$1/build/web/vv" >/usr/local/bin/appto
chmod 777 /usr/local/bin/appto
######cyoutubedown
###cp /root/fcode/ytd /root/fcode/$1/build/web/vv
####chmod 777 /root/fcode/$1/build/web/vv/ytd
#######
sed -i "/root/c\root /root/fcode\/$1/build/web;" /etc/nginx/sites-enabled/default
reboot
