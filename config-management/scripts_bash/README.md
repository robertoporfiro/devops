# Cheatsheet bash script

## Debug
- `set -x` : print everything
- `set -e` : print only error
- `set -u` : print


## Variables
- Every involke variables witn `${}`
- `#` : arguments number
- `@` : arguments
- `?` : Exit status of last task
- `$` : PID

## Conditions
- [[ NUM -eq NUM ]]`:	Equal
- [[ NUM -ne NUM ]]`:	Not equal
- [[ NUM -lt NUM ]]`:	Less than
- [[ NUM -gt NUM ]]`:	Greater than
- [[ ! EXPR ]]`:	Not
- Ex:
`while [ ${ITER} -lt $(expr $PARAMETERS_SIZE + 1) ]; do ...`

## String variables

- `[[-z ${String}]]`: zero value
- `[[-n ${String}]]`: not empty value
- Ex:
```
# String
if [[ -z "$string" ]]; then
  echo "String is empty"
elif [[ -n "$string" ]]; then
  echo "String is not empty"
fi
```

## Conditional
```
git commit && git push
git commit || echo "Commit failed"
```


## Functions examples

- Documentation
```
usage() {
	cat <<- EOF
    Usage: [-sd <start-date>] [-ed <end-date>] [OPTIONAL -store <store>] [OPTIONAL -ddl <ddl>]
    Example: ./runImportForAllStores.sh -sd 2019-02-02 -ed 2019-02-03 -store araujo -ddl drop
    -sd <start date>                YYYY-MM-DD
    -ed <end date>                  YYYY-MM-DD
    -store <store>                  <OPTIONAL> If no store is given, so, by default, all stores will run.
    -ddl <Data Definition Language> Its possible four arguments: <drop>, <create>, <dropAndCreate> and <importer>
                                    If no ddl is given, so, return argument error.
                                    By default, run <dropAndCreate> without store to run all stores.
    The script do:
    - Drop schema in mysql. Its possible drop only DB with parameter [OPTIONAL -store <store>] [-ddl <drop>]
    - Create schema in mysql. Its possible create only DB with parameter [OPTIONAL -store <store>] [-ddl <create>]
    - Drop and create all schemas <default>. Its possible drop and create only DB with parameter [OPTIONAL -store <store>]   [OPTIONAL -ddl <dropAndCreate>]
    - Run only importer. If parameter [-ddl <importer>]
	EOF
	exit 1
}
```

- check errors
```
check_errors() {
    if [ ${?} != 0 ];
    then
      echo "Error running import cockpit for ${STORE_TO_PROCESS}" >> ${LOG_FILE}
      echo "Error $? running import cockpit for ${STORE_TO_PROCESS}"
      exit 1
    fi
}
```

- Check number of args passed
```
# check number of arguments passed
if (( ${#} < 6 || ${#} > 8 )); then
	echo "ERROR: You entered $# parameters"
	echo -e "You must enter minimum 6 command line arguments.\n"
	usage
fi
```

---
## References 
- https://howtoubuntu.org/how-to-execute-a-run-or-bin-file-in-ubuntu
- https://devhints.io/bash
## Author
- Bruno Aurélio Rôzza de Moura Campos (brunocampos01@gmail.com)
## Copyright
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Bruno A. R. M. Campos</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
