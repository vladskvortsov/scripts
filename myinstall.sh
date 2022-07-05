#!/bin/bash





function check_installedv(){

GREEN="\033[0;32m"
RED="\033[0;31m"
NOCOLOR="\033[0m"
installedv=$(apt-cache policy $2 | grep Installed)
exitc=$(echo $? | grep .)

if [[ $installedv == *none* ]] || [[ $exitc -gt 0 ]]

then

 echo -e "${RED} $1
   Fail ${NOCOLOR}"

else
 echo -e "${GREEN} $1
   Success ${NOCOLOR}"



fi

}


function Docker(){

apt update -y
apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update
apt install -y docker-ce
id -nG

check_installedv "                      $(docker --version)
                            " docker-ce

}


function Docker-compose(){

apt update -y
apt install -y sudo
apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update
apt install -y docker-compose-plugin

check_installedv "
$(apt-cache policy docker-compose-plugin)
                           " docker-compose-plugin

}


function Telegram-Desktop(){

apt-get update -y
apt install -y telegram-desktop

check_installedv "
$(apt-cache policy telegram-desktop)
                           " telegram-desktop


}


function Google-Chrome(){

apt-get update -y
apt-get install -y wget sudo gnupg

sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
apt-get update
apt-get install -y google-chrome-stable

check_installedv "
$(google-chrome-stable --version)
                                " google-chrome-stable

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
     " -a array
 for choice in "${array[@]}"; do


case $choice in

[1]* ) Docker

 ;;

[2]* ) Docker-compose

;;

[3]* ) Telegram-Desktop

 ;;


[4]* ) Google-Chrome

;;

[5]* ) Docker
Docker-compose
Telegram-Desktop
Google-Chrome

check_installedv "
$(docker --version)
                            " docker-ce

check_installedv "
$(docker compose version)
                           " docker-compose-plugin

check_installedv "
$(apt-cache policy telegram-desktop)
                           " telegram-desktop


 ;;

[6]* )

#Exit

break

;;


*) continue

;;




esac

done

exit 1

done


#Spotify(not working)

# curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
# echo "deb http://repository.spotify.com стабільний небезкоштовний" | sudo tee /etc/apt/sources.list.d/spotify.list
# apt-get update && sudo apt-get install spotify-client




#function check_exit_code(){

#GREEN="\033[0;32m"
#RED="\033[0;31m"
#NOCOLOR="\033[0m"
#exit_code=$(echo $?)

#if [ $exit_code -eq 0 ]
#then
# echo -e "${GREEN} Success ${NOCOLOR}"

#else

# echo -e "${RED} Fail ${NOCOLOR}"
#fi

#}



#function color(){
# GREEN="\033[0;32m"
# RED="\033[0;31m"
# NOCOLOR="\033[0m"

#echo -e "${GREEN} $1 ${NOCOLOR}"

#}
