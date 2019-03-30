### Check exit status
`$?`<br/>
```
check_errors() {
    if [ $? != 0 ];
    then
      echo "Error running import cockpit for $STORE_TO_PROCESS" >> $LOG_FILE
      echo "Error $? running import cockpit for $STORE_TO_PROCESS"
      exit 1
    fi
}
```

### check number of arguments
`$#`<br/>
- Example
```
#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "You must enter exactly 2 command line arguments"
fi
echo $#
```

### Documentation
- Example
```
usage() {
cat << EOF
    Usage: [-sd <start-date>] [-ed <end-date>] [OPTIONAL -store <store>] [OPTIONAL -ddl <ddl>]
    Example: ./runImportForAllStores.sh -sd 2019-02-02 -ed 2019-02-03 -store araujo -ddl drop
    -sd <start date>                YYYY-MM-DD
    -ed <end date>                  YYYY-MM-DD
    -store <store>                  <OPTIONAL> If no store is given, so, by default, all stores will run.
    -ddl <Data Definition Language> Its possible four arguments: <drop>, <create>, <dropAndCreate> and <importer>
                                    If no ddl is given, so, return argument error.

    The script do:
    - Drop schema in mysql. Its possible drop only DB with parameter [OPTIONAL -store <store>] [-ddl <drop>]
    - Create schema in mysql. Its possible create only DB with parameter [OPTIONAL -store <store>] [-ddl <create>]
    - Drop and create all schemas <default>. Its possible drop and create only DB with parameter [OPTIONAL -store <store>] [OPTIONAL -ddl <dropAndCreate>]
    - Run only importer. If parameter [-ddl <importer>]
EOF
}
```

### Test if file exists
```
if [ ! -f "$@" ]; then
    echo "File "$@" doesn't exist"
    exit
fi
```

### Extract file by using extension as reference
```
case "$@" in
    *.7z ) 7z x "$@" ;;
    *.tar.bz2 ) tar xvjf "$@" ;;
    *.bz2 ) bunzip2 "$@" ;;
    *.deb ) ar vx "$@" ;;
    *.tar.gz ) tar xvf "$@" ;;
    *.gz ) gunzip "$@" ;;
    *.tar ) tar xvf "$@" ;;
    *.tbz2 ) tar xvjf "$@" ;;
    *.tar.xz ) tar xvf "$@" ;;
    *.tgz ) tar xvzf "$@" ;;
    *.rar ) unrar x "$@" ;;
    *.zip ) unzip "$@" ;;
    *.Z ) uncompress "$@" ;;
    * ) echo " Unsupported file format" ;;
esac
```


### Histograms
```
$ < data/tips.csv Rio -ge 'g+geom_histogram(aes(bill))' | display
```
<br/>or<br/>
```
data/tips.csv csvcut -c bill | feedgnuplot --terminal 'dumb 80,25' \
--histogram 0 --with boxes --ymin 0 --binwidth 1.5 --unset grid --exit
```


### References:
- https://linuxconfig.org/bash-scripting-tutorial-for-beginners
