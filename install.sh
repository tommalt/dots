#!/bin/sh

set -e

files=`git ls-files`
for f in $files; do
	if [[ "$f" == "README" ]] || [[ "$f" == "install.sh" ]]; then
		continue;
	fi
	target="$HOME/dots/$f";
	cp "$target" "$HOME/$f";
done

