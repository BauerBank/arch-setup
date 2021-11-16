#!/bin/bash
#Update the Pc
pacman -Syu
#Install the esiacels from the offical repos
pacman -S firefox thunderbird discord teamspeak3 git
#make the aur work and install yay
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
#remove the yay-git folder
cd ~
rm -d yay-git
#update the AUR
yay -Syu
#install packegs from the AUR
yay -S teams spotify visual-studio-code-bin github-desktop
