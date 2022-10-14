#!/bin/bash

apt-get update
apt-get install dialog



GREEN="\033[0;32m"
RED="\033[0;31m"
TURQUOISE="\033[0;96m"
NOCOLOR="\033[0m"




display_progress(){

  out=$( apt-get update -y -qq -o=Dpkg::Use-Pty=0 && $1 )
  percent=0

  (
  while test $percent != 101
  do
  echo $percent
  echo "$out"
  percent=`expr $percent + 1`
  done
  ) | dialog --title "Progress" --gauge "Installing:
  $result1
  $result2
  $result3
  $result4
  $result5
  $result6
  $result7
  $result8
" 10 60 0


}


display_result(){

#dialog   --mixedgauge   "Installing" 10 20 40 spotify 5

  dialog --title "Finished" \
    --no-collapse \
    --msgbox "
    $result1
    $result2
    $result3
    $result4
    $result5
    $result6
    $result7
    $result8
     " 0 0
}



function check_installedv(){

installedv=$(apt-cache policy $2 | grep Installed)

if [[ $installedv == *none* ]]
then

echo "$2: Fail"

# echo -e "${RED} $1
#   Fail ${NOCOLOR}"

else

echo "$2: Success"

#   echo -e "${GREEN} $1
#     Success ${NOCOLOR}"

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


cmd=(dialog --separate-output --checklist "What would you like to install?" 22 76 16)

options=(1 "Docker" off
         2 "Docker-compose" off
         3 "Telegram Desktop" off
         4 "Google Chrome" off
         5 "Spotify" off
         6 "Atom" off
         7 "Qbittorrent" off
         8 "Virtualbox" off
         9 "All of it.." on)

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in

      1) result1=$(check_installedv "                      $(docker --version)
                                  " docker-ce)

       display_progress Docker
continue

       ;;

      2) result2=$(check_installedv "
      $(apt-cache policy docker-compose-plugin)
                                 " docker-compose-plugin)

       display_progress Docker-compose

continue

      ;;

      3) result3=$(check_installedv "
      $(apt-cache policy telegram-desktop)
                                 " telegram-desktop)

      display_progress Telegram-Desktop
continue

       ;;

      4) result4=$(check_installedv "
      $(google-chrome-stable --version)
                                      " google-chrome-stable)

      display_progress Google-Chrome

continue

      ;;

      5) result5=$(check_installedv "
      $(spotify -version)
                                 " spotify-client)

    display_progress Spotify-client

continue

      ;;

      6) result6=$(check_installedv "
      $(atom -version)
                                 " atom)

       display_progress Atom

continue

      ;;

      7) result7=$(check_installedv "
      $(qbittorrent -v)
                                 " qbittorrent)

      display_progress Qbittorrent
continue

      ;;

      8) result8=$(check_installedv "
      $(apt-cache policy virtualbox)
                                 " virtualbox)

      display_progress Virtualbox

continue

      ;;

      9)

       result1=$(check_installedv "                      $(docker --version)
                                  " docker-ce)

       result2=$(check_installedv "
       $(apt-cache policy docker-compose-plugin)
                                                             " docker-compose-plugin)

       result3=$(check_installedv "
       $(apt-cache policy telegram-desktop)
                                                             " telegram-desktop)
       result4=$(check_installedv "
       $(google-chrome-stable --version)
                                                             " google-chrome-stable)
       result5=$(check_installedv "
       $(spotify -version)
                                                             " spotify-client)

       result6=$(check_installedv "
       $(atom -version)
                                                             " atom)

       result7=$(check_installedv "
       $(qbittorrent -v)
                                                             " qbittorrent)
       result8=$(check_installedv "
       $(apt-cache policy virtualbox)
                                                             " virtualbox)


       display_progress "$(Docker
      Docker-compose
      Telegram-Desktop
      Google-Chrome
      Spotify-client
      Atom
      Qbittorrent
      Virtualbox)" && display_result

      ;;

    esac


    exit 1

 done

 display_result

#end
