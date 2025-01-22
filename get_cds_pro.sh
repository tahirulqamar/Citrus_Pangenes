#########################################################################
# File Name: get_cds_pro.sh
# Author: ma6174
# mail: ma6174@163.com
# Created Time: Mon Jun 24 22:07:32 2019
#########################################################################
#!/bin/bash

for i in *.fa
do
	echo ">process $i"
	pre=$(basename $i | sed 's/\.fa//')
	gffread $pre.gff3 -g $i -x $pre.cds -y $pre.pro
	echo "<done"
done
