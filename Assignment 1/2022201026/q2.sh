#!/bin/bash

flag=0
while [ $flag -eq 0 ]
do
	command1 () { apg -a 1 -M Cl -m 2 -x 2 -E 1234567890 -n 1; }
	command2 () { apg -a 1 -m 3 -x 15 -M SNCL -n 1; }
	command3 () { apg -a 1 -M NCl -m 1 -x 3 -n 1; }

	pass="$(command1)$(command2)$(command3)"

	if [[ $pass =~ [[:lower:]]{2} ]]
	then
		continue
	else
		break
	fi
done
echo "$pass"


