#!/bin/bash
cmusstatus=$(cmus-remote -C status)
grep position <<< "$cmusstatus" 1>/dev/null 2>&1
if [ ! $? -eq 0 ]; then exit; fi
file=$(echo "$cmusstatus"|grep '^file'| cut -d' ' -f2 | xargs basename)
echo -n "$file"
