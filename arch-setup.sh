#!/bin/bash
# I based my skript on the ubu_movein.sh by antiqua
# you can get the original here https://forum.ubuntuusers.de/topic/in-shell-skript-wechsel-zwischen-root-und-aktu/

function usage ()
{
 echo "usage: sudo $0 username"
}

# Check for (required) command-line arg
if [ -z "$1" ]
	then
		usage
  		exit 65
fi

# test if root
if [ $UID != 0 ]
	then 
		# you are not root
		echo 	
		echo "you have to be root. please use sudo!"
		echo  
		usage
		exit 126
fi

# test if the user is a "real" user
if [ -z $(id -u $1 2>/dev/null) ] 
	then
		# the user did not exist
		echo "user $1 did not exist"
		usage
		exit 126
elif [ $(id -u $1) -le 999 ]   
	then
		echo "user $1 is a restricted system-user (like syslog or saned)"
		usage
		exit 126
fi

# root-stuff to do
echo "====="
echo "doing root-stuff now:"
echo "====="
sleep 2

#Update the Pc
pacman -Syu
#Install the esiacels from the offical repos
pacman -S --needed firefox geary teamspeak3 git yay nano base-devel curtail deja-dup gnome-extensions gnome-tweaks gparted handbrake htop lutris wireguard-tools flatpak gnome-todo
whoami

# user-stuff to do
echo "====="
echo "doing user-stuff for user $1 now"
echo "====="
sleep 2 

su $1 -c " \
yay -Syu; \
yay -S --needed teams visual-studio-code-bin github-desktop-bin etcher-bin tela-circle-icon-theme-git touchegg ccstudio cutecom gnome-browser-connector; \
flatpak install flathub com.github.joseexposito.touche; \
flatpak install flathub com.spotify.Client; \
flatpak install flathub org.signal.Signal; \
flatpak install flathub com.github.eneshecan.WhatsAppForLinux; \
flatpak install flathub com.discordapp.Discord; \
flatpak install flathub us.zoom.Zoom; \
"

# Es empfiehlt sich die folgenden Extensions zu installiern:
# - AppIndicator and KStatusNotifierItem Support extension
# - Just Perfection
# - Net speed Simplified
# - Sound Input & Output Device Chooser
# - Bing Wallpaper
# - Status Area Horizontal Spacing
# - Hibernate Status Button
# - X11 Gestures
# - WireGuard Indicator 

#Bluetooth on Arch:
#Öffne dieses File: sudo nano /etc/bluetooth/main.conf
#Stelle AutoConnect auf true und lass die Kommentierung weg
#Einstellung ControllerMode in bredr for airpods
#https://www.reddit.com/r/Ubuntu/comments/kxujrc/bluetoothairpods_connection_issue/
#für bluetooth low energy "sudo btmgmt le on" eingeben

#VPN:
#for vpnc: https://askubuntu.com/questions/1403896/cant-add-cisco-compatible-vpn-vpnc-on-network-manager-ubuntu-22-04/1404609#1404609
#for wireguard: https://wiki.lucabauer.de/doku.php?id=tut:wireguard
#and if you want install WireGuard Indicator 

#Bash castemize:
#Synth-shell
#https://github.com/andresgongora/synth-shell
#config is in ~/.config/synth-shell/
#color cheatseaht: https://www.ditig.com/256-colors-cheat-sheet
#YT: https://www.youtube.com/watch?v=jS-QZKjAd-U

#Serial usb device
#https://lavendthomas.github.io/p#st/create-usb-serial-file-arch-linux/
#sudo mknod /dev/ttyUSB0 c 118 0
#sudo mknod /dev/ttyUSB1 c 118 1
#Serial port group uucp https://bbs.archlinux.org/viewtopic.php?id=222093

#LibreOffice Spellcheck: https://wiki.archlinux.org/title/LibreOffice#Language_aids

#GNOME-gestures:
#if using X11 not wayland
#you need touchegg from the aur
#than you need to enable and start the touchegg service
#sudo systemctl enable touchegg.service
#sudo systemctl start touchegg
#last you have to add the x11 gestures extension
#https://bbs.archlinux.org/viewtopic.php?id=265360
#if you like you can add more gestures with the gui apk touche from flathub

#nvidia driver instalation:
#sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader linux-headers

#battery laptop
#command für akku deteils und optionenen: "sudo tlp-stat -b"

#ethernet dongle laptop install Dhcpcd see https://wiki.archlinux.org/title/Dhcpcd

#install reflector for faster updates https://wiki.archlinux.de/title/Reflector
