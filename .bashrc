
#git shorthands
alias gs='git status'
alias gc='git checkout'
alias gmd='git merge dev --no-commit --no-ff'
alias gmdc='git commit -m "merge dev"'
alias gmdu='git checkout .'

#Used for creating a new git project
alias ng="git init;echo first file > firstfile.txt;git add .;git commit -m 'first commit';"

#Save my configs to github
alias sg='c=$(pwd);cd c:globals;cp ~/.bashrc .; cp ~/.gitconfig .;git add .;git commit -m "updated globals";git push;cd $c'

alias c=clear
alias ss="cd c:code/strategysearch.master/Source"
alias lsa='ls -a'
alias tc='cd c:testcode'
alias npp="C:\\\Program\ Files\ \(x86\)\\\Notepad++\\\notepad++.exe"
alias e="nano"
alias eb='nano ~/.bashrc'
alias eg='nano ~/.gitconfig'



