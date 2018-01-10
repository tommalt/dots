#!/bin/bash

set -e

function exclude {
	if [[ "$1" == "README" ]] || [[ "$1" == "install.sh" ]] || [[ $1 == *.h ]]; then
		return 0
	fi
	return 1
}
files=`git ls-files`
for f in $files; do
	if exclude "$f"; then
		continue;
	fi
	target="$HOME/dots/$f";
	cp "$target" "$HOME/$f";
	echo "Installed $HOME/$f";
done

