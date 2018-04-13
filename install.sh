#!/bin/bash

set -e
cd "$HOME/dots"
function exclude {
	if [[ "$1" == "README.md" ]] || [[ "$1" == "install.sh" ]] || [[ $1 == *.h ]] || [[ "$1" == "assets" ]]; then
		return 0
	fi
	return 1
}
files=`find . -type d -name 'assets' -prune -o -type f -not -iwholename "*.git*" $(printf "! -name %s " $(cat ignore)) | cut -d'/' -f2-`
for f in $files; do
	if exclude "$f"; then
		continue;
	fi
	dest="$HOME/$f"
	dir=$(dirname "$dest")
	if [ ! -d "$dir" ]; then
		mkdir -p "$dir";
	fi
	src="$HOME/dots/$f";
	echo "cp $src $dest"
	cp "$src" "$dest";
done
