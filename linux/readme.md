# Linux Commands

## Search comands:
`apropose <PARAMETRO>`

## view manual
`man <BINARIE>`<br/>

www.explainshell.com<br/>
explain commands, example: 

explainshell.png

## Find 
`find /etc -name <FILE>`

## dpkg problems
```
sudo dpkg --configure -a
sudo apt-get -f install
sudo apt-get -f remove

sudo apt-get autoclean
sudo apt-get autoremove
sudo apt-get update


sudo apt-get upgrade
```




## (Language Programming) Alternatives List 
 CMD: `update-alternatives`

- Ex with Python<br/>
- Check version<br/>
`python --version`

- Install python 2.7 and 3.7
`update-alternatives --install /usr/bin/python python /usr/bin/python2.7 2`
`update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1`

- Alter python versions<br/>
`sudo update-alternatives --config python`

python_alternatives.png

---

## Glossary

https://linuxconfig.org/linux-commands

`pwd`  print the current working directory path


### File and directory
- `cat -n ` add line numbers to all lines
- `mkdir dir1` Creating a directory
- `touch file1` Creating files and reading the file content
- `cat -n todo-list.txt` display a content of any text file eith numenbers line.
- `file todo-list.txt` Obtain the file type
- `rm -r my_files` remove repository

 
 
 ### Permissions execute, write, read
- `chmod +xwr file` 
 - x, execute
 - w, write
 - r, read
 - Ex: <br/>
 ```
 chmod +x hello_world.sh
 ./hello_world.sh 
 ```

 #### Alter onwer file or repository
 `sudo chown USER-NAME FILE_OR_REPOSITORY`<br/>
  <br/>
 chown.png
 
### System information
- kernel version <br/>
`uname -a` 

- System Operation and version<br/>
`cat /etc/lsb-release`

- Process<br/>
`ps` current processes

- Htop ...

- Memory<br/>
`free`


### Service managemant
O Systemd é um gerenciador de sistema de inicialização

- Start service<br/>
`sudo systemctl start application.service`

- Service initiaze in boot<br/>
`sudo systemctl enable application.service`

- Status
`systemctl status application.service`


### Configuration profile
`cd /etc/profile.d/`



Fonte: https://sempreupdate.com.br/como-usar-o-systemctl-para-gerenciar-servicos-do-systemd/

###


---
## 
- https://linuxconfig.org/how-to-change-default-python-version-on-debian-9-stretch-linux
