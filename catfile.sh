#########################################################################
# File Name: catfile.sh
# Author: ma6174
# mail: ma6174@163.com
# Created Time: Wed Apr 10 17:39:18 2019
#########################################################################
#!/bin/bash

if [ $# -lt 1 ]
then 
	echo -e "\n\tUsage: sh $0\tfile_1\tfile_2...\n"
	exit 1
fi

for i in $@
do
	awk '!/^#/{print}' $i >> tmp_list;
done

while read line
do
	cat $line >> tmp_results
done < tmp_list
