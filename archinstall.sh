#!/bin/bash

pacman -Sy git --noconfirm
if test ! "$(which yaourt)"; then
	echo -e "[+] Installing Yaourt!"
	cd /tmp
	git clone https://aur.archlinux.org/package-query.git
	cd package-query
	makepkg -si
	cd ..
	git clone https://aur.archlinux.org/yaourt.git
	cd yaourt
	makepkg -si
	cd ..
	rm -rf package-query yaourt
else
	echo -e "Yaourt already installed."
fi


apps=(
	google-chrome
	
	ack
	openssh

	nmap

	zsh
	zsh-completions

	python3

	httpie
	tree

	docker
)

for (( i = 0; i < ${#apps[@]}; i++ )) do
	echo -e "[+] Installing ${apps[$i]} repository ${NC}"
	yaourt -Sy $apps[$i] --noconfirm
done

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
