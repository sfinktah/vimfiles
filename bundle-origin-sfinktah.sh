#!/usr/bin/env bash
for fn in bundle/*/.git; do ( cd "$(dirname "$fn")"; git remote -v | grep -v sfinktah | head -n1 | 
sed -e 's@git://github.com/@@' -e 's@https://github.com/@@' -e 's@^\w\+\s\+@@' -e 's@\s\+.*@@'

) # | grep -q 'sfinktah' && echo "$fn" 
done
