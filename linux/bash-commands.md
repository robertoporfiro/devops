# comands_linux

Type of problem:

```
sudo dpkg --configure -a
sudo apt-get -f install
sudo apt-get -f remove
sudo apt-get update
sudo apt-get upgrade
```


### While and for
```
while read line;
do
    ./create-cockpit-store.sh -c config/cockpit.cfg -e prd -n ${line}
done < /tmp/list-clients.txt
```
<br/>
```
for i in $(cat /tmp/list-clients.txt); 
do 
    ./lala.sh $i;
done
```
<br/>
