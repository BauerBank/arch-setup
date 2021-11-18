#!/bin/bash
#Update the Pc
pacman -Syu
#Install the esiacels from the offical repos
pacman -S firefox thunderbird discord teamspeak3 git yay nano base-devel
#update the AUR
yay -Syu
#install packegs from the AUR
yay -S teams visual-studio-code-bin github-desktop-bin whatsdesk-bin stacer-bin spotify
yay -S spotify
