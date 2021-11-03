#!/usr/bin/python3.8

# encoding: utf-8
import sys
import requests


def get_service(consul, sn):
    url = 'http://' + consul + '/v1/agent/services'
    #print('查找服务URL' + url + ' 服务：' + sn)
    data = requests.get(url).json()
    for k in data:
        service_name = data[k]['Service']
        if service_name == sn:
            #print(data[k]['ID'])
            print(data[k]['ID'].replace(sn,"").replace("-",""))


if __name__ == '__main__':
    get_service(sys.argv[1], sys.argv[2])
