#!/usr/bin/python

# python hbaseToCsv.py get mobly generaldata 2017-01-22 2017-01-22 site@site,page@busca,provider@neemusearch data:click

import sys
import csv
import struct
import happybase # sudo pip install happybase
import json
from datetime import datetime,timedelta

# thrift
TIMEOUT     = 10000 # 10 seconds
THRIFT_HOST = 'thrift-realtime.bigdata.chaordicsystems.com'
THRIFT_PORT = 9090

def conHbase(tableName):
    hTable = None
    try:                                        # Connect and get data from hbase
        connection = happybase.Connection(THRIFT_HOST, THRIFT_PORT, TIMEOUT)
        connection.open()
        hTable = connection.table(tableName)
    except Exception as e:
        sys.stderr.write(str(e))

    return hTable

def getValue(hTable, rowKey, columnName):
    value = None

    try:
        # to get all data from column family 'data'
        #data = hTable.row(rowKey, columns=['data'])
        data = hTable.row(rowKey, columns=[columnName])
        if columnName not in data:
            return value

        resultArray = struct.unpack('>q', data[columnName])
        value = resultArray[0]
        if (columnName == 'data:revenue'):
            value = float(value/float(100))
    except Exception as e:
        sys.stderr.write('Error on Thrift or HBase: %s\n' % str(e))

    return value

def printData(resDataList):
    try:
        writer = csv.writer(sys.stdout, delimiter='\t', quotechar='|')
        writer.writerow(resDataList)
    except Exception as e:
        sys.stderr.write('Error when writing to stdout: %s\n' % str(e))

def main():
    try:
        method      = str(sys.argv[1]) # method to use on HBase
        tableName   = str(sys.argv[2]) # table name to query
        rowKey      = str(sys.argv[3]) # hbase row key
        columnName  = str(sys.argv[4]) # data column name, e.g. 'data:click'
        rowKeyItems = rowKey.split(',')

        if method != 'get':
            raise ValueError()

        if len(rowKeyItems) < 2:
            raise ValueError()

        store = rowKeyItems[0]
        date  = rowKeyItems[1]

    except Exception as e:
        sys.stderr.write(('Execute: %(script)s get <table name> <row key>' +
                '<column name>\n') % {'script': sys.argv[0]})
        sys.stderr.write('<row key>: store,date[,key1,key2,...,keyn]')
        exit(1)

    hTable = conHbase(tableName)
    if hTable is None:
        sys.stderr.write('No connection to table ' + tableName + '\n')
        exit(1)

    resData  = {
        'store': store,
        'date': date,
        'table': tableName,
        'rowKey': rowKey,
        'columnName': columnName,
        'value': getValue(hTable, rowKey, columnName)
    }
    #printData([store, date, rowKey, columnName, resData['value']])
    print json.dumps(resData, indent=2, separators=(',', ': '))

if __name__ == '__main__':
    main()
