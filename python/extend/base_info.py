#!/usr/bin/python
#coding=utf8
"""
# Author: luanpeng
# Created Time : 2018-06-04 21:43:23

# File Name: base_info.py
# Description:

"""

class BaseInfo(object):


    def __init__(self):
        print 'base_info'

    def process(self):
        print 'base process'
        self.process_data()

    def process_data(self):
        print 'base process data'

