#! /usr/bin/zsh
find . -type d -name '.git' | while read dir; do sh -c "cd $dir/../ && echo -e \"\n GIT STATUS IN ${dir//\.git/}\" && git status -s"; done 
