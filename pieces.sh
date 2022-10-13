


#sed 's/ / /g'



#!/bin/bash

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>log.out 2>&1

usr=$(whoami | grep .)
sudo groupadd -f docker
sudo usermod -aG docker $(whoami)
sudo -u $(whoami) newgrp docker

sudo login $usr

id -nG





apt-get install -y htop


wget "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.696/gcmcore-linux_amd64.2.0.696.deb" -O /tmp/gcmcore.deb
sudo dpkg -i /tmp/gcmcore.deb
git-credential-manager-core configure
git config credential.helper store gpg







DIRS=(/bin/* /etc/*)


#
# Show a progress bar
# ---------------------------------
# Redirect dialog commands input using substitution
#
dialog --title "" --gauge "installing..." 10 75 < <(
   # Get total number of files in array
   n=${#DIRS[*]};

   # set counter - it will increase every-time a file is copied to $DEST
   i=0

   #
   # Start the for loop
   #
   # read each file from $DIRS array
   # $f has filename
   for f in "${DIRS[@]}"
   do
      # calculate progress
      PCT=$(( 100*(++i)/n ))

      # update dialog box
cat <<EOF
XXX
$PCT
"$f"...
XXX
EOF
  # copy file $f to $DEST
apt-get update -qq -o=Dpkg::Use-Pty=0
   done
)






#seq 1 100|dialog --gauge "A gauge" 0 0



#dialog --title "Copy file" --gauge "Copying file..." 10 75 < <(

cmd=(dialog --separate-output --checklist "What would you like to install?" 22 76 16)

options=(1 "Docker" off
         2 "Docker-compose" off)

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in

      1)


      out=$(apt-get update -y )
      percent=0

      (
      while test $percent != 101
      do
      echo $percent
      echo "$out"
      echo "XXX"
      percent=`expr $percent + 1`

      #apt-get update -qq -o=Dpkg::Use-Pty=0
      done
      ) | dialog --title "Progress" --gauge "Installing.." 10 60 0





continue

       ;;

      2)

       out=$(apt-get upgrade -y )
       percent=0

       (
       while test $percent != 101
       do
       echo $percent
       echo "$out"
       echo "XXX"
       percent=`expr $percent + 1`

       #apt-get update -qq -o=Dpkg::Use-Pty=0
       done
       ) | dialog --title "Progress" --gauge "Installing.." 10 60 0


continue


      ;;

esac

   done












#!/bin/bash
function two() {
   echo "test2-1"; apt-get update -y;
   echo "test2-2"; sleep 1;
   echo "test2-3"; sleep 1;
   echo "test2-4"; sleep 1;
   echo "test2-5"; sleep 1;
}

(
    items=5
    processed=0
    while [ $processed -le $items ]; do
        pct=$(( $processed * 100 / $items ))
        echo "XXX"
        echo "Processing item $processed" # Here I wish instead $processed
                                          # to be value (test2-1, test2-2 etc.)
                                          # of processed echo
        echo "XXX"
        echo "$pct"
        processed=$((processed+1))
        sleep 3 # Instead of this it should be when echo is finished printing
    done
) | dialog --title "Gauge" --gauge "Wait please..." 10 60 0






while true ; do
for i in \| \/ \- \\ \| \/ \- \\
do
echo "\b\b$i \c"
sleep 1
done
done





#!/bin/sh
out=$(apt-get update -y)
percent=0

(
while test $percent != 101
do
echo $percent
echo "$out"
echo "XXX"
percent=`expr $percent + 1`

#apt-get update -qq -o=Dpkg::Use-Pty=0
done
) | dialog --title "Progress" --gauge "Installing.." 10 60 0







#apt-get update -y 2>&1 | dialog --progressbox 30 100
