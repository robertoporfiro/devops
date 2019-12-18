#!/usr/bin/python

import argparse
import json
import sys
import os
import time
import requests
from pathlib import Path

PATH_CONFIG_DIR = '/config/'
PATH_PROJECT = str(Path(__file__).parent.parent)
PATH_CONFIG = PATH_PROJECT + PATH_CONFIG_DIR + 'prod.json'

# Load config
with open(PATH_CONFIG, 'r') as f:
    config = json.load(f)

URL_CLIENTS = config["create_store_list"]["URL_CLIENTS"]
URL_CONFSERVER = config["create_store_list"]["URL_CONFSERVER"]
DATABASES_FILE =  PATH_PROJECT + PATH_CONFIG_DIR + str(config["create_store_list"]["DATABASES_FILE"])
TIMEOUT = int(config["create_store_list"]["timeout"])
MAX_RETRIES = int(config["create_store_list"]["max_retries"])
PATH_LOG = config["app"]["log"]["streams"][0]["path"]
INPUT = config["create_store_list"]["INPUT"]

USER = os.environ['PLAT_USER']
PASSWORD = os.environ['PLAT_PASSWORD']
STORES_LIST = json.load(sys.stdin)   # store list created by cockpit


def drop_file(path):
    """
    Drop each execution the file neemu-etl-prod.log
    """
    try:
        if os.path.exists(path):
            os.remove(path)

    except IOError as err:
        print 'IOError: ', err
        pass


def retry(url, timeout, max_retries, user, password):
    """
    Function to retry connection in url
    """
    for retry in xrange(0, max_retries):
        r = requests.get(url,
                         timeout=timeout,
                         auth=(user, password))

        if r.status_code == 200:
            return r.json()
        else:
            print 'Retry: ', retry
            time.sleep(timeout)

    raise Exception('Request Error in ', url)


def get_data(url, timeout, max_retries, user, password):
    """
    Function to prepare each stores
    :return: dict with stores
    """
    clients = retry(url, timeout, max_retries, user, password)

    # Prepare json
    databases = {}

    for client in clients:
        if client['enable'] == True and client['cockpit'] == True and 'mysqlDatabaseName' in client:
            store_name = client['mysqlDatabaseName']

            if client["mysqlDatabaseName"] == "novologImpulse_core":
                store_name = "novologCasaevideo"  # sample

            databases[client['id']] = {
                "host": "cockpit-rds.internal.platform.linximpulse.net",
                "user": "cockpit",
                "password": "eetiAPd*",
                "database": store_name,
                "charset": "UTF8"
            }

    return databases


def generate_databases_json(file_db_json, dict_db):
    """
    Create datadabases.json
    :return: file datadabases.json
    """
    try:
        with open(file_db_json, mode='w+') as writer: # w+ create file if it doesn't exist
            json.dump(dict_db,
                      writer,
                      indent=2,
                      ensure_ascii=False)
    except IOError:
        raise Exception('Request Error in ', file_db_json)


def generate_valid_clients(input, stores_list, url, timeout, max_retries, user, password):
    """
    Function to return all valid clients
    """
    cockpit_stores = stores_list
    all_clients = retry(url, timeout, max_retries, user, password)

    if input == 'config':
        cockpit_stores = stores_list['db']['mysql']['stores']

    for client in all_clients:
        if client['info']:
            if ('status' in client['info'] and
                client['info']['status'].lower() == 'active') and \
                ('neemuSearchEnabled' in client['info'] and
                client['info']['neemuSearchEnabled'].lower() == 'true') and \
                ('etlSearchEnabled' in client['info'] and
                client['info']['etlSearchEnabled'] == 'true'):
                apikey = client['apiKey']

                if apikey in cockpit_stores:
                    del cockpit_stores[apikey]

    return cockpit_stores.keys()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Generate store list')
    parser.add_argument('-i',
                        '--input',
                        type=str,
                        default='databases',
                        required=False,
                        help='input file')
    parser.add_argument('-s',
                        '--store',
                        type=str,
                        default='all',
                        required=False,
                        help='store to process')

    args = parser.parse_args()
    INPUT = args.input
    specific_store = args.store

    drop_file(PATH_LOG)
    client_list = generate_valid_clients(INPUT,
                                         STORES_LIST,
                                         URL_CLIENTS,
                                         TIMEOUT,
                                         MAX_RETRIES,
                                         USER,
                                         PASSWORD)

    dict_db = get_data(URL_CONFSERVER,
                       TIMEOUT,
                       MAX_RETRIES,
                       USER,
                       PASSWORD)

    generate_databases_json(DATABASES_FILE, dict_db)

    if specific_store == 'all':
        print ','.join(client_list)
    else:
        specific_store = specific_store.split(',')
        valid_specific_store = []

        for st in specific_store:
            if st in client_list:
                valid_specific_store.append(st)

        print ','.join(valid_specific_store)
