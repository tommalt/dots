#!/bin/bash
if [ $# -ne 2 ]; then
	echo "Usage `basename $0` [TERMINAL] [DIR]";
	echo "Launch terminal in the directory specified by [DIR]";
	exit 1;
fi
echo $2 > ~/.d
$1 -e /bin/bash &
sleep 0.5
rm ~/.d    # this is so every new terminal will not try to CD into this

