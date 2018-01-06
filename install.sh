#!/bin/sh

set -e

files=`git ls-files`
for f in $files; do
	if [[ "$f" == "README" ]] || [[ "$f" == "install.sh" ]]; then
		continue;
	fi
	target="$HOME/dots/$f";
	ln -sf "$target" "$HOME/$f";
done

