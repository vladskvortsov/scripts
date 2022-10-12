#!/bin/bash



 #############################################################################
 #   myinstall.sh - installs soft on Ubuntu/Debian. Simple menu,             #
  #  actual versions. Adapted for docker images. Should run with sudo.      #
 #   Use "space" to choose a few "1 2 5" etc..                               #
  #   Software included:                                                    #
 #     -Docker                                                               #
  #    -Docker-compose                                                      #
 #     -Telegram Desktop                                                     #
  #    -Google Chrome                                                       #
 #     -Spotify                                                              #
  #    -Atom Editor                                                         #
 #     -Qbittorrent                                                          #
  #    -Virtualbox                                                          # 
 #############################################################################

GREEN="\033[0;32m"
RED="\033[0;31m"
TURQUOISE="\033[0;96m"
NOCOLOR="\033[0m"


function check_installedv(){

installedv=$(apt-cache policy $2 | grep Installed)
#exitc=$(echo $? | grep .)

if [[ $installedv == *none* ]]
then

 echo -e "${RED} $1
   Fail ${NOCOLOR}"

else

 echo -e "${GREEN} $1
   Success ${NOCOLOR}"

fi

}


function Docker(){

apt-get install -y sudo apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io
sudo groupadd -f docker
sudo usermod -aG docker $(whoami)
id -nG

check_installedv "                      $(docker --version)
                            " docker-ce

}


function Docker-compose(){

apt-get install -y sudo apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-get update -y
apt-get install -y docker-compose-plugin
sudo groupadd -f docker
sudo usermod -aG docker $(whoami)
id -nG

check_installedv "
$(apt-cache policy docker-compose-plugin)
                           " docker-compose-plugin

}


function Telegram-Desktop(){

apt-get install -y telegram-desktop

check_installedv "
$(apt-cache policy telegram-desktop)
                           " telegram-desktop


}


function Google-Chrome(){

apt-get install -y wget sudo gnupg
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
apt-get update -y
apt-get install -y google-chrome-stable

check_installedv "
$(google-chrome-stable --version)
                                " google-chrome-stable

}


function Spotify-client(){

apt-get install -y sudo gnupg curl
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update -y
apt-get install -y spotify-client

check_installedv "
$(spotify -version)
                           " spotify-client

}

function Atom(){

apt-get install -y wget sudo gnupg
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
apt-get update -y
apt-get install -y atom


check_installedv "
$(atom -version)
                           " atom


}

function Qbittorrent(){

apt-get install -y sudo
sudo add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
sudo apt update -y
sudo apt install -y qbittorrent

check_installedv "
$(qbittorrent -v)
                           " qbittorrent


}

function Virtualbox(){

apt-get install -y wget sudo gnupg
sudo apt-get install -y software–properties–common
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add –
echo "deb [arch=amd64] http://virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt-get update -y
sudo apt-get install -y virtualbox

check_installedv "
$(apt-cache policy virtualbox)
                           " virtualbox


}


while true
do

echo -e "${TURQUOISE}
#############################################################################
#   myinstall.sh - installs soft on Ubuntu/Debian. Simple menu,             #
 #  actual versions. Adapted for docker images. Should run with sudo.      #
#   Use "space" to choose a few "1 2 5" etc..                                   #
#############################################################################
  ${NOCOLOR}"
echo "What would you like to install?
                          "
echo "1) Docker"
echo "2) Docker-compose"
echo "3) Telegram Desktop"
echo "4) Google Chrome"
echo "5) Spotify"
echo "6) Atom"
echo "7) Qbittorrent"
echo "8) Virtualbox"
echo "9) All of it.."
echo "10) Exit"

read -p "
Choose number(1-7):
     " -a array
 for choice in "${array[@]}"; do


case $choice in

[1]* ) apt-get update -y && Docker

 ;;

[2]* ) apt-get update -y && Docker-compose

;;

[3]* ) apt-get update -y && Telegram-Desktop

 ;;


[4]* ) apt-get update -y && Google-Chrome

;;

[5]* ) apt-get update -y && Spotify-client

;;

[6]* ) apt-get update -y && Atom

;;

[7]* ) apt-get update -y && Qbittorrent

;;

[8]* ) apt-get update -y && Virtualbox

;;


[9]* ) apt-get update -y && Docker
Docker-compose
Telegram-Desktop
Google-Chrome
Spotify-client
Atom
Qbittorrent
Virtualbox

check_installedv "
$(docker --version)
                            " docker-ce

check_installedv "
$(docker compose version)
                           " docker-compose-plugin

check_installedv "
$(apt-cache policy telegram-desktop)
                           " telegram-desktop

check_installedv "
$(google-chrome-stable --version)
                                " google-chrome-stable

check_installedv "
$(spotify -version)
                           " spotify-client


check_installedv "
$(atom -version)
                           " atom
check_installedv "
$(qbittorrent -v)
                           " qbittorrent


;;

[9]* )

#Exit

break


;;

*) continue

;;


  esac

 done

  exit 1

done


#End
