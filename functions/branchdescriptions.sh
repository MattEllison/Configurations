
declare -A branchNames;
branchNames[test]='hello';


#--Local Branch Name helper
function nameBranch(){
	branchNames[$1]=$2;
}

function lb(){
	for K in "${!branchNames[@]}"; do echo -e "$K \t ${branchNames[$K]}";  done 
}

function nb(){
	branchNames[$1]=$2
}


