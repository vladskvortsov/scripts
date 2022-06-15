#!/bin/bash

 
function color(){

 GREEN="\033[0;32m"	
 NOCOLOR="\033[0m"

echo -e "${GREEN} $1 ${NOCOLOR}"
 
}
 

function Docker(){

apt update
apt install sudo
apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update
apt install docker-ce
id -nG

color "                     
$(docker --version)
                            "

} 


function Docker-compose(){

apt update
apt install sudo
apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update
apt install docker-compose-plugin

color "                     
$(docker compose version)
                           "

} 


function Telegram-Desktop(){

apt install telegram-desktop

} 


function Google-Chrome(){

apt-get update
apt-get install wget sudo gnupg

sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
apt-get update 
apt-get install google-chrome-stable

color "                        
$(google-chrome-stable --version)
                                "


} 


while true
do



echo "                     
Що бажаєте встановити?
                          "
echo "1) Docker"
echo "2) Docker-compose"
echo "3) Telegram Desktop"
echo "4) Google Chrome"
echo "5) Все згадане"
echo "6) Вихід"

read -p "                     
Введіть будь ласка номер(1-6):
                      " choice

case $choice in

1) Docker

 ;;

2) Docker-compose
 
;;

3) Telegram-Desktop

 ;;


4) Google-Chrome 

 ;;

5) Docker
Docker-compose
Telegram-Desktop
Google-Chrome

color "                
$(docker --version)"

color "                
$(docker compose version)"


 ;;

6)

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
# apt-get update && sudo apt-get install spotify-client




