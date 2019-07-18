PS1="\w \[\033[33m\]\]\$(parse_git_branch) \[\033[00m\] $ "
CLICOLOR=1
 LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias gs='git status'
function gcb(){
	local currentBranch=$(git branch | grep \* | cut -d ' ' -f2);

}

function gc(){
	if test $# -eq 0; then echo -e "\e[31mNeed Commit Mesage"; return 0;fi;
	hasUntrackedFiles=$(git status | grep 'Untracked' | wc -l);
	hasunStagedFiles=$(git status | grep 'Changes not staged for commit' | wc -l);
#	echo "Has Untracked Files - $hasUntrackedFiles";
#	echo "Has Unstaged files - $hasunStagedFiles"
	if test "$hasUntrackedFiles$hasunStagedFiles" -ne "00"; then echo -e '\e[31mCanelling Commit. Looks like you forgot to add some files. \n\nRunning Git Status\n\n\e[0m';git status;return 0; fi;
	
	#If all test passed
	git commit -m "$*"
}

alias gmd='git merge dev --no-commit --no-ff'
alias gmdc='git commit -m "merge dev"'
alias gmdu='git checkout .'
alias gsl='git stash list'
#alias gco='git checkout'
alias gdf='git diff --compact-summary'
alias gd='git diff --ignore-space-at-eol -b -w --ignore-blank-lines --compact-summary --ignore-all-space | grep -v " 0"' #List only filenames of changes that dont include whitespaces
alias gb='git branches | head'
alias get='git'
alias gr='echo "GIT REFLOG";git reflog'
alias gl='echo "GIT LOG";git log --oneline'

function gco(){
	if test $# -ne 1;then echo -e "\e[31mNeed 1 Argument";return 0;fi;
	git checkout $1	
}


#Allows me to unstage a particular index
function gsa(){
	local __index=$1
	echo "Unstashing $__index"
	git stash apply stash@{$__index}
}

#auto complete
function gc_autoComplete(){   
	C=$(git rev-parse --abbrev-ref HEAD)   
	COMPREPLY+=("$C") 
} 
complete -F gc_autoComplete gc

#Used for creating a new git project
alias ng="git init;echo first > file;git add .;git commit -m 'first commit';"

#Added this mostly for playing around with git. Allows me to delete everything in the respective folder and start over.
alias reh='find -delete'


#Save my configs to github
#alias sg='c=$(pwd);cd c:Configurations;cp ~/.bashrc .; cp ~/.gitconfig .;git add .;git commit -m "updated globals";git push;cd $c;s'
function sg(){
	#Check if commit message was passed
	local __commitMessage="$*";
	if [ -z "$1" ]
	then
		__commitMessage='updated globals';
	fi

	local __c=$(pwd);
	cd c:/Configurations;
	git pull;

	#Git my global configs
	cp ~/.vimrc .; #Vim configuration
	cp ~/.bash_profile .; 
	cp ~/.gitconfig .;
	cp ~/karabiner.json .;
	#cp ~/ConEmu.xml .;
	FILE=c\:/cmder/vendor/conemu-maximus5/conemu.xml
	if test -f "$FILE"; then
		echo "$FILE exist"
		cp c\:/cmder/vendor/conemu-maximus5/conemu.xml .
	fi



	#cp -r ~/functions .;
	
	#Get my Vscode Settings
	
	cp ~/AppData/Roaming/Code/User/keybindings.json ./vscode
	cp ~/AppData/Roaming/Code/User/settings.json ./vscode
	cp -r ~/AppData/Roaming/Code/User/snippets/. ./vscode/snippets
	git add .;
	git commit -m "$__commitMessage";
	git push;

	cd $__c;
}

alias c=clear
alias ss="cd c:code/"
#List all hidden files
alias lsa='ls -a'

#Location of my test code
alias tc='cd c:testcode'
alias npp="C:\\\Program\ Files\ \(x86\)\\\Notepad++\\\notepad++.exe"

#e=Edit for my editor of choice
alias e="vim"

#I just wanted to easily added to my config files
#alias eb='vim ~/.bash_profile'
#alias eg='vim ~/.gitconfig'
alias eb='npp ~/.bash_profile'
alias eg='npp ~/.gitconfig'

