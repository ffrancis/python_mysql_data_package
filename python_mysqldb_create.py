#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Compiled by Felix Francis (felixfrancier@gmail.com)

Description:    MySQL programming with Python to create a LRPCR_DATAPACKAGE in which primer and amplicon information can be stored and retrieved efficinetly.

'''

############################################################
## PYTHON FUNCTIONS
############################################################
import time
import MySQLdb as mdb
import sys

############################################################
## Time to run the code: start timer
############################################################
t0 = time.time()

############################################################
## Code
############################################################

# Open database connection
db = mdb.connect('localhost', 'testuser', 'test623', 'LRPCR_DATAPACKAGE');		#(localhost, username, password, databasename)

# prepare a cursor object using cursor() method
cursor = db.cursor()


############################################################
##  Table `mydb`.`Loci`
############################################################
# Drop table if it already exist using execute() method.










############################################################
## Time to run the code: end timer
############################################################
t1 = time.time()

total = t1-t0
print '\n', "Time to run code = ", total, " seconds", '\n'




















