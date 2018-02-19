#!/bin/bash

set -e
if [ -d /usr/local/share/kak/rc ]; then
	base=/usr/local/share/kak/rc
elif [ -d /usr/share/kak/rc ]; then
	base=/usr/share/kak/rc
else
	echo "Error: could not find kakoune in /usr/share or /usr/local/share"
	exit 1;
fi

cd ~/dots/.config/kak/autoload
targets=`find . -type f | cut -d'/' -f2-`

# first, check if all the targets exist, then copy 
for t in $targets; do 
	target="$base/$t"
	if [ ! -e $target ]; then
		echo "Error: could not find $target"
		exit 1;
	fi
done

for t in $targets; do
	target="$base/$t"
	cp $target $t
done
