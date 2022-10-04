


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
