#!/bin/bash
# Inx-Service (c) Veikko Kero 2017

echo -e "Follow the instructions on the screen... if any. \n"

# Start in devenv directory
cp -r ./upload-scripts/ ../

echo -e "Adding Code::Blocks repository.\n"
sudo add-apt-repository ppa:damien-moore/codeblocks-stable
sudo apt-get update

echo -e "Installing Code::Blocks and Cutecom.\n"
sudo apt-get -y install codeblocks codeblocks-contrib cutecom

echo -e "Giving user named $USER rights to use Cutecom"
CURRENT_USER=$USER
sudo usermod -a -G dialout $CURRENT_USER

# Move to home folder
cd ~/

echo -e "Great! Next we'll download some git repos... \n"
sudo rm -r contiki
git clone --recursive git://github.com/contiki-os/contiki
git clone --recursive git://github.com/Weptech-elektronik/contiki ./contiki-weptech
git clone git://github.com/RIOT-OS/RIOT.git

echo -e "Ok. Now I'll try to compile and start Cooja Network Simualtor. \n"
# Go to Cooja folder
cd ./tools/cooja
sudo ant run

echo -e "Now it's time for some serious compiling... \n"

# Go to Sakers border router example folder
cd ~/contiki-weptech/examples/saker/ip64-rpl-border-router

sed -i '94s/.*/#define PLATFORM_CONF_USE_CC1200        0/' project-conf.h
make TARGET=saker
mv border-router.bin ~/upload-scripts/br-cc1200.bin
make clean

sed -i '94s/.*/#define PLATFORM_CONF_USE_CC1200        1/' project-conf.h
make TARGET=saker
mv border-router.bin ~/upload-scripts/br-cc2538.bin
make clean

# Download Thingsquare firmware for Weptech
cd ~/upload-scripts && wget "www.thingsquare.com/download/firmware/weptech-868mhz.bin"

# Go to Desktop and generate launcher
cd ~/Desktop
echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Terminal=true
Exec=/home/$USER/upload-scripts/upload
Name=Saker Uploader
Comment=Starts a script used to upload stuff to Weptech Saker
Icon=transmission" >> upload.desktop

chmod +x upload.desktop

echo -e "Well well well, all done. You're welcome. Now you will need to log back in. \n"
read -p "Press any key if you understood."
dbus-send --session --type=method_call --print-reply --dest=org.gnome.SessionManager /org/gnome/SessionManager org.gnome.SessionManager.Logout uint32:1
