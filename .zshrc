#source ~/.bash_profile
#setopt NO_CASE_GLOB
alias gs='git status'



function gc(){
	if test $# -eq 0; then echo -e "\e[31mNeed Commit Mesage"; return 0;fi;
	hasUntrackedFiles=$(git status | grep 'Untracked' | wc -l);
	hasunStagedFiles=$(git status | grep 'Changes not staged for commit' | wc -l);
#	echo "Has Untracked Files - $hasUntrackedFiles";
#	echo "Has Unstaged files - $hasunStagedFiles"
	if test "$hasUntrackedFiles$hasunStagedFiles" -ne "00"; then echo -e '\e[31mCanelling Commit. Looks like you forgot to add some files. \n\nRunning Git Status\n\n\e[0m';git status;return 0; fi;
	
	#If all test passed
}


# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

autoload -U compinit
compinit

#  END case insensitve setup

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

# Start git stuf
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

#end git stuff