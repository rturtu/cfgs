# Always be polite
alias please=sudo
alias vim=nvim
alias vi=nvim

function run_java(){
    MYSELF=`which "$0" 2>/dev/null`
    [ $? -gt 0 -a -f "$0" ] && MYSELF="./$0"
    java=java
    if test -n "$JAVA_HOME"; then
        java="$JAVA_HOME/bin/java"
    fi
    exec "$java" $java_args -jar $MYSELF "$@"
    exit 1
}

# caps = esc
setxkbmap -option caps:escape

function comp(){
	name=${1%.*};
	filetype=${1##*.};
	if [[ $filetype == cpp ]]; then
		time g++ -DMY_PC -g -lm -std=c++17 $1 -o .$name;
	elif [[ $filetype == c ]]; then
		time gcc -g -lm -lpthread a2_helper.c $1 -o .$name;
	elif [[ $filetype == tex ]]; then
		pdflatex $1;
		firefox $name.pdf;
	else
		echo "Filetype $filetype not known!";
	fi
}

function run( ){
	filetype=${1##*.};
	if [[ $filetype == py ]]; then
		python3 $1
	else
		comp $1;
		name=${1%.*};
		time ./_$name
	fi
}

function cmpp(){
	nbSources=$#;
	for i in $(seq 1 1 $nbSources )
	do
		comp ${!i};
		if [[ 0 -ne $? ]];
		then
			echo "${!i} compilation error";
			return;
		fi
	done
	if [[ 2 -ge $nbSources ]]
	then
		echo "Not enough Sources";
		return;
	fi

	tests=1;
	echo -ne "Test";
	for i in $(seq 3 1 $nbSources )
	do
		echo -ne "\t\t${!i}";
	done
	echo;
	while [[ 0 -ne 1 ]]
	do
		./_${1%.*} >input.txt
		./_${2%.*} <input.txt >ok.txt
		echo -ne "$tests";
		for i in $( seq 3 1 $nbSources )
		do
			./_${!i%.*} <input.txt >output.txt
			diff --ignore-blank-lines ok.txt output.txt
			if [[ $? -ne 0 ]]
			then
				echo -ne "\t\tNO";
				return;
			else
				echo -ne "\t\tYES";
			fi	
		done
		((tests++));
		echo;
	done
