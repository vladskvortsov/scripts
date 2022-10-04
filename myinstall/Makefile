.PHONY: all menu install_all
all: menu install_all

SHELL:=/bin/bash
.ONESHELL:

#GREEN := \033[0;32m
#RED := \033[0;31m
#TURQUOISE := \033[0;96m
#NOCOLOR := \033[0m



menu:
	@echo "What would you like to install?"

install_all: Docker Docker-compose Telegram-Desktop Google-Chrome Spotify Atom show_ver
Docker:
	apt-get install -y sudo apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
	add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
	apt-get update -y
	apt-get install -y docker-ce docker-ce-cli containerd.io
	sudo groupadd -f docker
	sudo usermod -aG docker $$(whoami)
	id -nG
	@echo -e "\033[0;32m $$(docker --version) \033[0m"

Docker-compose:
	apt-get install -y sudo apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
	add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
	apt-get update -y
	apt-get install -y docker-compose-plugin
	sudo groupadd -f docker
	sudo usermod -aG docker $$(whoami)
	id -nG
	@echo -e "\033[0;32m $$(docker compose version) \033[0m"
Telegram-Desktop:
	apt-get install -y telegram-desktop
	@echo -e "\033[0;32m $$(apt-cache policy telegram-desktop) \033[0m"

Google-Chrome:
	apt-get install -y wget sudo gnupg
	sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
	apt-get update -y
	apt-get install -y google-chrome-stable
	@echo -e "\033[0;32m $$(google-chrome-stable --version) \033[0m"

Spotify:
	apt-get install -y sudo gnupg curl
	curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
	@echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
	apt-get update -y
	apt-get install -y spotify-client
	@echo -e "\033[0;32m $$(spotify -version) \033[0m"

Atom:
	apt-get install -y wget sudo gnupg
	wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
	sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
	apt-get update -y
	apt-get install -y atom
	@echo -e "\033[0;32m $$(atom -version) \033[0m"

show_ver:
	@echo -e "\033[0;32m $$(docker --version) \033[0m"
	@echo -e "\033[0;32m $$(docker compose version) \033[0m"
	@echo -e "\033[0;32m $$(apt-cache policy telegram-desktop) \033[0m"
	@echo -e "\033[0;32m $$(google-chrome-stable --version) \033[0m"
	@echo -e "\033[0;32m $$(spotify -version) \033[0m"
	@echo -e "\033[0;32m $$(atom -version) \033[0m"
