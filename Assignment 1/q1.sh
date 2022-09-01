#!/bin/bash

echo -e "\c"
set -f
read N
prev=2
op=0
for a in $(seq 2 $N)
do
	k=0
	for((i=2; i<=$a/2; i++))
	do
		if [ $(expr $a % $i) -eq 0 ]
		then
			k=1
			break
		fi
	done
	if [ $k -eq 0 ]
	then
		new=$(expr $a - $prev)
		if [ $new -eq 2 ]
		then
			root=$(expr $a * $prev)
			digitsum=0
			while [ $root -gt 0 ]
			do
				mod=$(expr $root % 10)
				digitsum=$(expr $digitsum + $mod)
				root=$(expr $root / 10)
			done
			op=$(expr $op + $digitsum)
		fi
		prev=$a
	fi
done

echo "$op"
