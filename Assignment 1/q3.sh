#!/bin/bash

echo -e "\c"
set -f
read N
flag=0
ans_arr=($N)
while [ $flag -eq 0 ]
do
	big_arr=()
	small_arr=()
	while [ $N -gt 0 ]
	do
		mod=$(expr $N % 10)
		big_arr+=($mod)
		small_arr+=($mod)
		N=$(expr $N / 10)
	done
	readarray -t small_arr < <(printf '%s\n' "${small_arr[@]}" | sort)
	readarray -t big_arr < <(printf '%s\n' "${big_arr[@]}" | sort -r)

	small_num=0
	big_num=0
	for t in ${small_arr[@]}
	do
		small_num=$(expr $(expr $small_num * 10) + $t)
	done

	for t in ${big_arr[@]}
	do
		big_num=$(expr $(expr $big_num * 10) + $t)
	done
	ans=$(expr $big_num - $small_num)
	if [ $ans -eq 6174 ]
	then
		ans_arr+=($ans)
		break
	fi

	N=$ans
	ans_arr+=($ans)
	continue

done

for i in "${ans_arr[@]}";
do
	if ((i != 6174))
	then
		echo -n "$i, "
		continue
	fi
	echo -n "$i"
done
