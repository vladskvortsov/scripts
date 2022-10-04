#/bin/bash

read -p 'If other OS need to be repaired, enter path to root:' path
echo $path

sudo rm $path/var/lib/apt/lists/lock
sudo rm $path/var/lib/dpkg/lock
sudo rm $path/var/lib/dpkg/lock-frontend
sudo rm $path/var/cache/apt/archives/lock

sudo chown -Rv _apt:root $path/var/cache/apt/archives/partial/
sudo chmod -Rv 770 $path/var/cache/apt/archives/partial/


sudo -u root apt-get -o Dir=$path clean

sudo -u root apt-get -o Dir=$path update --fix-missing
sudo -u root apt-get -o Dir=$path install -f


sudo dpkg --configure -a --root=$path
sudo -u root apt-get -o Dir=$path upgrade -y
sudo -u root apt-get -o Dir=$path dist-upgrade -y


sudo -u root apt-get -o Dir=$path update -y

sudo -u root dpkg --get-selections --root=$path | grep -v deinstall > packages

sudo dpkg --root=$path --set-selections < ~/packages && sudo apt-get -u dselect-upgrade


sudo -u root apt-get -o Dir=$path reinstall linux-firmware
