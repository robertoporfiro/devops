
#!/bin/bash
# Autor: brunocampos01	
# Script: ./install_java.sh
# ----------------------------------- #
# Script install OFICIAL version JAVA 11
# input: N/A
# output: Version do java
# ----------------------------------- #

echo -e "Preparing download in OFFICIAL SITE \n"
cd /tmp
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \https://download.oracle.com/otn-pub/java/jdk/11.0.1+13/90cf5d8f270a4347a95050320eef3fb7/jdk-11.0.1_linux-x64_bin.deb
echo
echo -e "======================================== \n"


echo -e "Install Java \n"
sudo dpkg -i jdk-11_linux-x64_bin.deb | sleep 3
echo
echo -e "======================================== \n"


echo -e "Version language Java \n"
java -version | sleep 3
echo
echo -e "======================================== \n"

echo -e "Version language Java \n"
jar -version | sleep 3
echo
echo -e "======================================== \n"


javac -version | sleep 3
echo -e " visit https://websiteforstudents.com/how-to-install-oracle-java-jdk-11-on-ubuntu-18-04-16-04-18-10/"
echo -e "======================================== \n"
