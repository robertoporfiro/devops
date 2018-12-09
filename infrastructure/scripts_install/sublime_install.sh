echo
echo "Install the GPG key: /n"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "--------------------------------"

echo
echo "Ensure apt is set up to work with https sources: /n"
echo
sudo apt-get install apt-transport-https
echo "--------------------------------"

echo "Select the channel to use:"
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
echo "--------------------------------"

echo "Update apt sources and install Sublime Text/n"
sudo apt-get update
sudo apt-get install sublime-text
echo "--------------------------------"
