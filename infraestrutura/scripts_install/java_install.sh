#!/bin/bash
# Autor: brunocampos01	
# Script: ./install_java.sh
# ----------------------------------- #
# Script install OFICIAL version JAVA 11
# Entrada: N/A
# Saida: Version do java
# ----------------------------------- #

echo -e "Add ppa repository \n"
sudo add-apt-repository ppa:linuxuprising/java
echo

echo -e "Update packages \n"
sudo apt-get update
echo

echo -e "Install Java \n"
sudo apt-get install oracle-java11-installer | sleep 3
echo

echo -e "Version language Java \n"
java -version | sleep 3
echo

echo -e "Version compiler Java \n"
javac -version | sleep 3
