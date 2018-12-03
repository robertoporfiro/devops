#!/bin/bash
# Author: brunocampos01
# Script: ./download_youtube.sh
# ----------------------------------- #
# Install and rum clipgrab
# Input: N/A
# Output: run clipgrab 
# ----------------------------------- #

echo -e "Download youtube vídeos (CLIPGRAB) \n"
echo

echo -e "Add ppa repository \n"
sudo add-apt-repository ppa:clipgrab-team/ppa
echo

echo -e "Update packages \n"
sudo apt-get update
echo

echo -e "Install CLIPGRAB \n"
sudo apt-get install clipgrab
echo

echo -e "Run application \n"
clipgrab
echo


