#!/bin/bash
# Autor: brunocampos01	
# Script: ./install_java.sh
# ----------------------------------- #
# Script install OFICIAL version JAVA 11
# input: N/A
# output: Version do java
# ----------------------------------- #

echo -e "Add ppa repository \n"
sudo add-apt-repository ppa:linuxuprising/java
echo

echo -e "Update packages \n"
sudo apt-get update && apt-get upgrade
echo

echo -e "remove the lock files \n"
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
echo

echo -e "reconfigure the packages \n"
sudo dpkg --configure -a
echo

echo -e "Install Java \n"
sudo apt-get install software-properties-common
sudo apt-get install oracle-java11-installer | sleep 3
echo

echo -e "Version language Java \n"
java -version | sleep 3
echo

echo -e "Version compiler Java \n"
javac -version | sleep 3
