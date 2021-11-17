#!/bin/bash
#Update the Pc
pacman -Syu
#Install the esiacels from the offical repos
pacman -S firefox thunderbird discord teamspeak3 git yay nano
#update the AUR
yay -Syu
#install packegs from the AUR
yay -S teams spotify visual-studio-code-bin github-desktop whatsdesk-bin
