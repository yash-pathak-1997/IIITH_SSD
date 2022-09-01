#!/bin/bash
echo -e "\c"
set -f
read N

if (( N == 0 )); then
	echo "2"
	exit
fi

if (( N == 1 )); then
	echo "1"
	exit
fi

q0=2
q1=1
qi=0

for (( i=2 ; i<=$N ; i++ )); do
	qi=$(expr $q0 + $q1)
	q0=$q1
	q1=$qi
done

echo "$qi"
