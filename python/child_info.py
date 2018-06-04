#!/usr/bin/python
#coding=utf8
"""
# Author: luanpeng
# Created Time : 2018-06-04 21:43:11

# File Name: child_info.py
# Description:

"""
from base_info import BaseInfo

class ChildInfo(BaseInfo):
    def __init__(self):
        print 'child init'

    def process_data(self):
        print 'child info'


