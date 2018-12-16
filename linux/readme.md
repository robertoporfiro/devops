# Linux

## Search comands:

`apropose <PARAMETRO>`

## view manual
`man <BINARIE>`<br/>

www.explainshell.com

## Find 
`find /etc -name <FILE>`

## dpkg problems
```
sudo apt-get autoclean
sudo apt-get autoremove
sudo apt-get update
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
- `chmod +xwr file` 
 - x, execute
 - w, write
 - r, read
 - Ex: 
 ```
 chmod +x hello_world.sh
 ./hello_world.sh 
 ```

### System information
` uname -a` kernel version

---
## 
- https://linuxconfig.org/how-to-change-default-python-version-on-debian-9-stretch-linux
