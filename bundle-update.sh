#!/usr/bin/env bash
cnt=0
cd ~/.vim/bundle &&
for d in *; do
  if [ -d $d/.git ]; then
    (
    cd $d && {
      git remote | grep -q 'upstream' && {
        # Don't background an upstream pull, because there might be merge conflicts
        echo "Updating origin $d in foreground"
        git pull origin master &&
        git pull upstream master &&
        git push origin master
      } || {
        # echo "Updating $d in background"
        git pull &
      }
      # Prevent having too many subprocesses
      (( (cnt += 1) % 16 == 0 )) && wait
    }
    )
  fi
done
wait
