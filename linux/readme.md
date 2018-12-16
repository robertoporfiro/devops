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

## <Language Programming> ALternatives List 
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
## 
- https://linuxconfig.org/how-to-change-default-python-version-on-debian-9-stretch-linux
