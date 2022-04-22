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
pacman -S --needed firefox geary discord teamspeak3 git yay nano base-devel curtail deja-dup gnome-extensions gnome-tweaks gparted handbrake htop lutris 
whoami

# user-stuff to do
echo "====="
echo "doing user-stuff for user $1 now"
echo "====="
sleep 2 

su $1 -c " \
yay -Syu; \
yay -S teams visual-studio-code-bin github-desktop-bin; \
"
