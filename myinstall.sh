#!/bin/bash

while true
do

echo "What would you like to install?"
echo "1) Docker"
echo "2) Docker-compose"
echo "3) Telegram Desktop"
echo "4) All of it."
echo "5) Exit"

read -p "Print a number:" choice


case $choice in

1)

#Docker

apt update
apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update
apt install docker-ce
usermod -aG docker ${USER}
id -nG

docker --version
 
;;

2)

#Docker-compose

curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

docker-compose --version

 ;;

3)

#Telegram Desktop

sudo apt install telegram-desktop

 ;;


4) 

#All of it.

continue ;;

5)

#Exit

break 

;;

*) continue

;;

esac

exit 1

done


#Spotify(not working)

# curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
# echo "deb http://repository.spotify.com стабільний небезкоштовний" | sudo tee /etc/apt/sources.list.d/spotify.list
# sudo apt-get update && sudo apt-get install spotify-client

#Google Chrome (not working)

# wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
# sudo apt-get update 
# sudo apt-get install google-chrome-stable




