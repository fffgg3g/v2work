#!/bin/bash
##########install jdk
wget https://download.oracle.com/java/18/latest/jdk-18_linux-x64_bin.tar.gz -O jdk1864.tar.gz
tar  -zxvf jdk1864.tar.gz
cp -r  jdk-18*   jdk18
rm -rf jdk-18*
#####set apk dir
###mkdir root/fcode/myapp/build/web/vv  first to install
echo "\cp /root/fcode/myapp/build/app/outputs/apk/release/*.apk /root/fcode/myapp/build/web/vv" >/usr/local/bin/appto
chmod 777 /usr/local/bin/appto
####
sed -i '$a\export JAVA_HOME="/root/jdk18"'  /etc/profile
sed -i '$a\export PATH="$PATH:$JAVA_HOME/bin"'  /etc/profile
source /etc/profile
################install android
wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip -O ancmd.zip
mkdir /root/android-sdk;mkdir /root/android-sdk/cmdline-tools
unzip -d /root/android-sdk/cmdline-tools/  ancmd.zip
cp  -r /root/android-sdk/cmdline-tools/cmdline-tools  /root/android-sdk/cmdline-tools/latest
rm -rf  /root/android-sdk/cmdline-tools/cmdline-tools
cd /root/android-sdk/cmdline-tools/latest/bin/
yes | ./sdkmanager --install  "build-tools;31.0.0" "platforms;android-31" "platform-tools" 
sleep 1m
yes | ./sdkmanager --licenses
sed -i '$a\export ANDROID_HOME="/root/android-sdk"'  /etc/profile
sed -i '$a\export PATH="$PATH:$ANDROID_HOME/platform-tools"'  /etc/profile
sed -i '$a\export PATH="$PATH:$ANDROID_HOME/platform"'  /etc/profile
source /etc/profile
reboot
