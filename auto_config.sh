#!/bin/bash

# This script will copy the appropriate configuration files to their respective locations to ensure a homogenious environment

if [[ `cat /etc/issue` == *CentOS* ]]; then
	

elif [[ `cat /etc/issue` == *Ubuntu* ]]; then
	