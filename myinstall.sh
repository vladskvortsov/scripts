#!/bin/bash

 
function color(){

 GREEN="\033[0;32m"	
 RED="\033[0;31m"
 NOCOLOR="\033[0m"

echo -e "${GREEN} $1 ${NOCOLOR}"
 
}

#function check_exit_code(){
 
#GREEN="\033[0;32m"  
#RED="\033[0;31m"
#NOCOLOR="\033[0m"
#exit_code=$(echo $?)

#if [ $exit_code = 0 ]
#then 
# echo -e "${GREEN} Success ${NOCOLOR}"

#elif [ $exit_code > 0 ]
#then 

# echo -e "${RED} Fail ${NOCOLOR}"
#fi
#}



function Docker(){

apt update -y
apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update
apt install -y docker-ce
id -nG

color "                     
$(docker --version)
                            "

} 


function Docker-compose(){

apt update -y
apt install -y sudo
apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update
apt install -y docker-compose-plugin

color "                     
$(docker compose version)
                           "

} 


function Telegram-Desktop(){

apt install -y telegram-desktop

color "$(apt-cache policy telegram-desktop)"
 

#check_exit_code
} 


function Google-Chrome(){

apt-get update -y
apt-get install -y wget sudo gnupg

sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
apt-get update 
apt-get install -y google-chrome-stable

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
#check_exit_code

color "                
$(docker --version)"

#check_exit_code

color "                
$(docker compose version)"

#check_exit_code

color "
$(apt-cache policy telegram-desktop)"

#check_exit_code

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




