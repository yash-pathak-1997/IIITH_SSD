#!/bin/bash
set -f
echo -e "\c"
read Y
day=0
month=0
year=$Y

while [ $year -gt 99 ]
do
	mod=$(expr $year % 10)
	year=$(expr $year / 10)
	day=$(expr $(expr $day * 10) + $mod)
done

while [ $year -gt 0 ]
do
	mod=$(expr $year % 10)
	year=$(expr $year / 10)
	month=$(expr $(expr $month * 10) + $mod)
done

flag=0

if [ $month -lt 13 ]
then
	if (( day >= 1 && day <= 31 )) && (( month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12 ))
	then
		flag=1
	elif (( day >= 1 && day <= 30 )) && (( month == 4 || month == 6 || month == 9 || month == 11 ))
	then
		flag=1
	elif (( day >= 1 && day <= 28 )) && (( month == 2 ))
	then
		flag=1
	elif (( day == 29 && month == 2 )) && (( ((Y % 400 == 0)) || (( Y % 4 == 0 && y % 100 != 0 )) ))
	then
		flag=1
	else
		flag=0
	fi
fi

if (( flag == 1 ))
then
	while [[ ${#day} -lt 2 ]] ; do
		day="0${day}"
	done

	while [[ ${#month} -lt 2 ]] ; do
		month="0${month}"
	done

	echo "$day-$month-$Y"
else
	echo "No Palindrome days available in the given year"
fi
