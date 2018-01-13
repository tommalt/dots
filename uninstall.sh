#!/bin/bash

set -e
cd "$HOME/dots"
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
	dest="$HOME/$f"
	echo "rm -rf $dest"
	rm -rf "$dest"
done
