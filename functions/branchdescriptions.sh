
declare -A branchNames;

#--Local Branch Name helper
function nameBranch(){
	branchNames[$1]=$2;
}


function lb(){
	echo 
#	for K in "${!branchNames[@]}"; do echo -e "$K \t ${branchNames[$K]}";  done
}

function nb(){
	echo -e "$1,$2" >> ~/branchlist.txt
	#branchNames[$1]=$2;
	#rm mattslist
	#for K in "${!branchNames[@]}"; do echo -e "$K,${branchNames[$K]}" >> mattslist;  done 
}




function loadlist(){
	cat ~/branchlist.txt | while read line;do
		key="${line/,*}";
		value="${line#*,}";
		echo $key $value
		#nb $key $value
		#branchNames["$key"]="$value";
		#lb
		#  grep -P '\t':w
		#$line
	done ;
}

