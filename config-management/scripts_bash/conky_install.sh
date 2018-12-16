#!/bin/bash
# Autor: brunocampos01	
# Script: ./install Conky.sh
# ----------------------------------- #
# Script install Conky
# input: N/A
# output: Conky runnig
# ----------------------------------- #

echo -e "Install Conky \n"
sudo apt-get install conky conky-all
echo
echo -e "======================================== \n"


echo -e "Install some extra staff \n"
sudo sudo apt-get install curl lm-sensors hddtemp
echo
echo -e "======================================== \n"


echo -e "start Conky in a background \n"
conky -d
echo
echo -e "======================================== \n"


echo -e "Complete: \n"
echo -e "-----------------------------"
echo -e "Name: conky"
echo -e "Command: conky -p 15"
echo -e "Comment: A system monitor\n"
echo -e "-----------------------------"
echo -e "Gnome interface \n"
gnome-session-properties

echo -e "restart Conky"
pkill -HUP conky
echo
echo -e "======================================== \n"

