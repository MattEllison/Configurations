
declare -A branchNames;

#--Local Branch Name helper
function nameBranch(){
	branchNames[$1]=$2;
}


function lb(){
	echo 
	for K in "${!branchNames[@]}"; do echo -e "$K \t ${branchNames[$K]}";  done 
}

function nb(){
	branchNames[$1]=$2;
	rm mattslist
	for K in "${!branchNames[@]}"; do echo -e "$K,${branchNames[$K]}" >> mattslist;  done 
}
test='what';
function loadlist(){
	cat mattslist | while read line;do
		key="${line/,*}";
		value=${line#*,};
		branchNames[$key]=$value;
		#  grep -P '\t':w
		#$line
	done;
}

