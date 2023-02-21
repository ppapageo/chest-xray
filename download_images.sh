#!/bin/bash
filename="$1"
it=0
while read -r line
do
	if [ "$line" ] # skip blank lines
  	then
		export URL=`echo $line`
		export NAME=images-${it}.tar.gz
		echo $NAME
		echo "Running wget -c ${NAME} $URL --continue"
		wget -O ${NAME} $URL --continue
		tar -xvzf ${NAME} 
		it=$((${it}+1));
	fi
done < "$filename"

echo "DONE"
