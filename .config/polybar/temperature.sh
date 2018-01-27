#!/bin/sh
sensors|grep 'temp[0-9]' |awk '{ print substr($2,2,length($2)-5)}'|tr "\\n" " "| sed 's/ /°C/g'
