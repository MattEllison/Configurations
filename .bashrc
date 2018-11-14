

#git shorthands
alias gs='git status;s'
alias gc='git commit -m'
alias gmd='git merge dev --no-commit --no-ff'
alias gmdc='git commit -m "merge dev"'
alias gmdu='git checkout .'
alias gsl='git stash list;s'
alias gco='git checkout'
alias gdf='git diff --compact-summary'
alias gb='git branches | head'
alias get='git'
alias s='echo ------'

function gsa(){
	local __index=$1
	echo "Unstashing $__index"
	git stash apply stash@{$__index}
}


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
alias reh='find -delete'


