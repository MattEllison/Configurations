#Command prompt settings
#helpful site = https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html

#PS1='\[\033]0;$MSYSTEM:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\nλ '
PS1='\n\[[\033[\33m\]DIR \w]\033[36m\]`__git_ps1`\[\033[0m\]\nSmart Stuff Here --> '

#git shorthands
alias gs='git status'
alias gc='git commit -m'
alias gmd='git merge dev --no-commit --no-ff'
alias gmdc='git commit -m "merge dev"'
alias gmdu='git checkout .'
alias gsl='git stash list'
alias gco='git checkout'
alias gdf='git diff --compact-summary'
alias gb='git branches | head'
alias get='git'
alias gr='echo "GIT REFLOG";git reflog'
alias gl='echo "GIT LOG";git log --oneline'

#Allows me to unstage a particular index
function gsa(){
	local __index=$1
	echo "Unstashing $__index"
	git stash apply stash@{$__index}
}


#Used for creating a new git project
alias ng="git init;echo first > file;git add .;git commit -m 'first commit';"

#Added this mostly for playing around with git. Allows me to delete everything in the respective folder and start over.
alias reh='find -delete'


#Save my configs to github
#alias sg='c=$(pwd);cd c:globals;cp ~/.bashrc .; cp ~/.gitconfig .;git add .;git commit -m "updated globals";git push;cd $c;s'
function sg(){
	local __c=$(pwd);
	cd c:globals;
	git pull;

	#Git my global configs
	cp ~/.bashrc .; 
	cp ~/.gitconfig .;
        cp c\:/cmder\ v1.3.6\ -\ full/vendor/conemu-maximus5/conemu.xml .

	git add .;
	git commit -m "updated globals";
	git push;

	cd $__c;
}

alias c=clear
alias ss="cd c:code/strategysearch.master/Source"

#List all hidden files
alias lsa='ls -a'

#Location of my test code
alias tc='cd c:testcode'
alias npp="C:\\\Program\ Files\ \(x86\)\\\Notepad++\\\notepad++.exe"

#e=Edit for my editor of choice
alias e="nano"

#I just wanted to easily added to my config files
alias eb='nano ~/.bashrc'
alias eg='nano ~/.gitconfig'



