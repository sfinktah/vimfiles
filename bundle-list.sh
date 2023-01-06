#!/usr/bin/env bash
cnt=0
cd ~/.vim/bundle && {
  for d in *; do
    if [ -d $d/.git ]; then
      cd $d > /dev/null 2>&1 && {
        git remote -v | 
          sort -r     |
          head -n 1   | 
          sed -e 's@git://github.com/@@' -e 's@https://github.com/@@' -e 's@^\w\+\s\+@@' -e 's@\s\+.*@@' -e 's@\.git$@@'
        cd ..
      }

    fi
  done
}
