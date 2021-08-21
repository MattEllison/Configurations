

alias gs='git status'

function gc(){


	if [ $# -eq 0 ]; then
		echo -e "\e[31mNeed Commit Mesage"
		return 0;
	 fi

	 
	hasUntrackedFiles=$(git status | grep 'Untracked' | wc -l);
	
	hasunStagedFiles=$(git status | grep 'Changes not staged for commit' | wc -l);
	
	test=$(echo "$hasUntrackedFiles$hasunStagedFiles" | xargs)
	 if [[ $test != "0 0" ]]; then 
	 	echo -e '\e[31mCanelling Commit. Looks like you forgot to add some files. \n\nRunning Git Status\n\n\e[0m';
	 	# git status;
	 	return 0; 
	 fi;
	
	#If all test passed
	git commit -m "$*"
}

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

autoload -U compinit
compinit -u

#  END case insensitve setup

#PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%3~%f%b %# '


# Start git stuf
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

#end git stuffexport PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="$PATH:/Users/mellison/code2/kafka_2.13-2.8.0/bin"


function bringGlobalsHome(){

	#cd /Users/mellison/code/personal/Configurations;
	

	#Git my global configs
	#cp ~/.exrc .; #Vim configuration
	cp ~/.zshrc ~/code/personal/Configurations; 
	cp ~/Library/Application\ Support/Code/User/settings.json ~/code/personal/Configurations; 
	#cp ~/.gitconfig .;
    #    cp c\:/cmder\ v1.3.6\ -\ full/vendor/conemu-maximus5/conemu.xml .
	#cp -r ~/functions .;
}


function saveGlobals(){
	#Check if commit message was passed
	local __commitMessage="$*";
	if [ -z "$1" ]
	then
		__commitMessage='updated globals';
	fi
	
	local __c=$(pwd);		

	cd ~/code/personal/Configurations;

	bringGlobalsHome
	git pull;
	git add .;
	git commit -m "$__commitMessage";
	git push;

	cd $__c;
}

function updateGlobals(){
	cp  ~/code/personal/Configurations ~/.zshrc; 
	cp  ~/code/personal/Configurations ~/Library/Application\ Support/Code/User/settings.json; 
}